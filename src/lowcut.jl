# ローカットフィルターをかける．
# 入力は，Wavedata型の波形データ．
# 直線成分を取り除いている．
function lowcut(wave::Wavedata; fp=0.1, fs=0.0720)
  ndr = 0; 
  nwave = wave.nwave; nch = wave.nch; hz = wave.hz
  wvout = Array{Float64}(undef, nwave, nch)
  for ich = 1:nch
      wvout[:, ich] = btfllc(ex_trend(wave.waveF[:, ich]), fp, fs, hz, ndr)
  end
  return Wavedata(wave.obs, wave.headtime, wave.nwave, wave.nch, wave.hz, wave.t, wave.chid, wvout)
end
