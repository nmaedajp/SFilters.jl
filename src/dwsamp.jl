function bandpass(wave::Wavedata; fl=0.1, fh=40.0, fs=50.0)
  ndr = 0; 
  nwave = wave.nwave; nch = wave.nch; hz = wave.hz
  wvout = Array{Float64}(undef, nwave, nch)
  for ich = 1:nch
      wvout[:, ich] = btbdp(ex_trend(wave.waveF[:, ich]), fl, fh, fs, hz, ndr)
  end
  return Wavedata(wave.obs, wave.headtime, wave.nwave, wave.nch, wave.hz, wave.t, wave.chid, wvout)
end

# ダウンサンプリングするための関数
function dwsamp(wave::Wavedata; nstep=2, fl=0.1, fh=40.0, fs=50.0)
    wavebdp = bandpass(wave; fl=fl, fh=fh, fs=fs)  # バンドパスフィルターをかける
    nwave = div(wave.nwave, nstep)
    nch = wave.nch
    hz = div(wave.hz, nstep)
    return Wavedata(wave.obs, wave.headtime, nwave, nch, hz, wave.t[1:nstep:end], wave.chid, wavebdp.waveF[1:nstep:end, :])
end
