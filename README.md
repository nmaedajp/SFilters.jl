# SFilters

斎藤のフィルターをjuliaに変換．

## recres_s
* function recres_s(h::Vector{Float64}, gn::Float64, fr::Vector{Float64})

## recfil
* function recfil(x,h,nml)

## tandem
* function tandem(x::Vector{Float64}, h::Vector{Float64}, nml::Int)

## btfllc
* btfllc(wavein,fp,fs,hz,ndr)
* バターワース型ローカット（ハイパス）フィルターのデータへの適用

## btflhc
* function btflhc(wavein,fp,fs,hz,ndr)
* バターワース型ハイカット（ローパス）フィルターのデータへの適用

## btbdp
* バターワース型バンドパスフィルターのデータへの適用
* function btbdp(wavein, fl, fh, fs, hz, ndr)

## buthip
* function buthip(fp::Float64, fs::Float64, ap::Float64, as::Float64)
* バターワース型ハイパスフィルターの設計．

## butlop
* function butlop(fp::Float64, fs::Float64, ap::Float64, as::Float64)
* バターワース型ローパスフィルターの設計．

## butpas
* function butpas(fl, fh, fs, ap, as)
* バターワース型バンドパスフィルターの設計．

## dwsamp
* function dwsamp(wave::Wavedata; nstep=2, fl=0.1, fh=40.0, fs=50.0)
  * 200 Hz を 100 Hzにダウンサンプリング想定している．
  * ダウンサンプリングするに際して，バンドパスフィルターをかけている．
  * 入力の wave は，Wavedata 型．
  * 戻り値は，Wavedata 型となる 

## bandpass
* function bandpass(wave::Wavedata; fl=0.1, fh=40.0, fs=50.0)
  * dwsamp の中から，呼んでいる．
  * バンドパスフィルターをかける．
  * 入力は，Wavedata型の波形データ．
  * 直線成分を取り除いている．

## lowcut
* function lowcut(wave::Wavedata; fp=0.1, fs=0.0720)
  * ローカットフィルターをかける．
  * 入力は，Wavedata型の波形データ．
  * 直線成分を取り除いている．

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://nmaedajp.github.io/SFilters.jl/stable/)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://nmaedajp.github.io/SFilters.jl/dev/)
[![Build Status](https://github.com/nmaedajp/SFilters.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/nmaedajp/SFilters.jl/actions/workflows/CI.yml?query=branch%3Amain)
