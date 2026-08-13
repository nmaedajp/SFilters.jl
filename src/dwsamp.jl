# ダウンサンプリングするための関数
# 入力は，Wavedata型の波形データ．
# 想定は，200 Hzの波形データを100 Hzにする．
function dwsamp(wave::Wavedata; nstep=2, fl=0.1, fh=40.0, fs=50.0)
    wavebdp = bandpass(wave; fl=fl, fh=fh, fs=fs)  # バンドパスフィルターをかける
    nwave = div(wave.nwave, nstep)
    nch = wave.nch
    hz = div(wave.hz, nstep)
    return Wavedata(wave.obs, wave.headtime, nwave, nch, hz, wave.t[1:nstep:end], wave.chid, wavebdp.waveF[1:nstep:end, :])
end
