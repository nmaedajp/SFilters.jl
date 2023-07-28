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

## buthip
* function buthip(fp::Float64, fs::Float64, ap::Float64, as::Float64)
* バターワース型ハイパスフィルターの設計．

## butlop
* function butlop(fp::Float64, fs::Float64, ap::Float64, as::Float64)
* バターワース型ローパスフィルターの設計．

## 予定

butbds，butbdp も気が向けば変換する．

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://nmaedajp.github.io/SFilters.jl/stable/)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://nmaedajp.github.io/SFilters.jl/dev/)
[![Build Status](https://github.com/nmaedajp/SFilters.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/nmaedajp/SFilters.jl/actions/workflows/CI.yml?query=branch%3Amain)
