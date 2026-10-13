# Generates seamless ambient loops (mono 16-bit 22.05kHz, 8 s) for assets/focus/.
import numpy as np, wave, sys, os
SR, SEC = 22050, 8
N = SR*SEC
rng = np.random.default_rng(7)
def lp(x, a):  # one-pole lowpass, circular warm-up for seamless loop
    y = np.empty_like(x); s = 0.0
    for _ in range(2):
        for i in range(len(x)):
            s += a*(x[i]-s); y[i] = s
    return y
def fft_filter(x, f):  # circular -> loops seamlessly
    X = np.fft.rfft(x); fr = np.fft.rfftfreq(len(x), 1/SR); return np.fft.irfft(X*f(fr), len(x))
def periodic_env(freq_hz_list, depth):
    t = np.arange(N)/SR; e = np.ones(N)
    for f in freq_hz_list: e += depth*np.sin(2*np.pi*round(f*SEC)/SEC*t + rng.uniform(0, 6))
    return e
def save(name, x):
    x = x/np.max(np.abs(x))*0.7
    with wave.open(os.path.join(sys.argv[1], name), 'wb') as w:
        w.setnchannels(1); w.setsampwidth(2); w.setframerate(SR)
        w.writeframes((x*32767).astype('<i2').tobytes())
w = rng.standard_normal(N)
save('white.wav', fft_filter(w, lambda f: 1/np.sqrt(1+(f/3000)**2)))
rain = fft_filter(rng.standard_normal(N), lambda f: ((f > 400)*1.0) / (1+(f/6000)**2))
drops = np.zeros(N); idx = rng.integers(0, N, 900); drops[idx] = rng.uniform(0.3, 1, 900)
drops = fft_filter(drops, lambda f: np.exp(-((f-2500)/1500)**2))
save('rain.wav', rain*periodic_env([0.25, 0.5], 0.08) + drops*3)
waves = fft_filter(rng.standard_normal(N), lambda f: 1/(1+(f/700)**2))
t = np.arange(N)/SR; swell = (0.55+0.45*np.sin(2*np.pi*(1/SEC)*t))**2
save('waves.wav', waves*swell)
forest = fft_filter(rng.standard_normal(N), lambda f: 1/(1+(f/400)**2))*periodic_env([0.125, 0.375], 0.2)
birds = np.zeros(N)
for k in range(10):
    s0 = rng.integers(0, N); L = int(SR*rng.uniform(0.08, 0.2)); tt = np.arange(L)/SR
    f0 = rng.uniform(2500, 4200); chirp = np.sin(2*np.pi*(f0*tt + rng.uniform(-6000, 6000)*tt**2))*np.hanning(L)
    for i in range(L): birds[(s0+i) % N] += chirp[i]*0.5
save('forest.wav', forest*0.6 + birds*0.25*np.max(np.abs(forest)))
