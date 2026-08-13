# バンドパスフィルターをかける．
# 入力は，Wavedata型の波形データ．
# 直線成分を取り除いている．
function bandpass(wave::Wavedata; fl=0.1, fh=40.0, fs=50.0)
  ndr = 0; 
  nwave = wave.nwave; nch = wave.nch; hz = wave.hz
  wvout = Array{Float64}(undef, nwave, nch)
  for ich = 1:nch
      wvout[:, ich] = btbdp(ex_trend(wave.waveF[:, ich]), fl, fh, fs, hz, ndr)
  end
  return Wavedata(wave.obs, wave.headtime, wave.nwave, wave.nch, wave.hz, wave.t, wave.chid, wvout)
end