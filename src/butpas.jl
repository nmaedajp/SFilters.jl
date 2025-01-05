function butpas(fl, fh, fs, ap, as)
    #
    # BUTPAS.FOR to butpas.jl. 
    # BUTPAS.FOR: M. Saito's program. (Saito(1978))
    # return h, m, gn, n
    # coded by chatGPT & N. Maeda on 20250105.
    #
        # 初期設定
        hp = pi / 2.0
    
        # 周波数の計算
        wl = min(abs(fl), abs(fh)) * pi
        wh = max(abs(fl), abs(fh)) * pi
        ws = abs(fs) * pi
    
        # 不正な入力の処理
        if wl == wh || wl == 0.0 || wh >= hp || ws == 0.0 || ws >= hp || (ws - wl) * (ws - wh) <= 0.0
            error("(butpas) fl = $(fl), fp = $(fp), fs = $(fs). fl, fp or fs is not correct.")
        end
    
        # フィルタ係数の計算
        clh = 1.0 / (cos(wl) * cos(wh))
        op = sin(wh - wl) * clh
        ww = tan(wl) * tan(wh)
        ts = tan(ws)
        os = abs(ts - ww / ts)
        pa = min(abs(ap), abs(as))
        sa = max(abs(ap), abs(as))
        pa = pa == 0.0 ? 0.5 : pa
        sa = sa == 0.0 ? 5.0 : sa
        ps = pa / sa
    
        n = max(2, Int64(floor(abs(log(pa / sa) / log(op / os)) + 0.5)))
        cc = exp(log(pa * sa) / n) / (op * os)
        c = sqrt(cc)
        ww *= cc
    #    @show n
    
        # 初期化
        dp = hp / n
        k = div(n, 2)
        m = 2 * k
        l = 0
        g = 1.0
        fj = 1.0
        h = Float64[]
    
        # メインループ
        for j in 1:k
            oj = 0.5 * Complex(cos(dp * fj), sin(dp * fj))
            fj += 2.0
            cq = sqrt(oj^2 + ww)
            r = [oj + cq, oj - cq]
            g *= cc
    #        @show j, r
            for i in 1:2
                re = real(r[i])^2
                ri = imag(r[i])
                a = 1.0 / ((c + ri)^2 + re)
                g *= a
    
                # フィルタ係数の更新
                push!(h, 0.0)
                push!(h, -1.0)
                push!(h, 2.0 * ((ri - c) * (ri + c) + re) * a)
                push!(h, ((ri - c)^2 + re) * a)
                # h[l + 1] = 0.0
                # h[l + 2] = -1.0
                # h[l + 3] = 2.0 * ((ri - c) * (ri + c) + re) * a
                # h[l + 4] = ((ri - c)^2 + re) * a
                l += 4
            end
        end
    
        # 奇数次の場合
        gn = g
        if n == m
            return h, m, gn, n
        end
    
        m += 1
        wpc = cc * cos(wh - wl) * clh
        wmc = -cc * cos(wl + wh) * clh
        a = 1.0 / (wpc + c)
        gn = g * c * a
    
        push!(h, 0.0)
        push!(h, -1.0)
        push!(h, 2.0 * wmc * a)
        push!(h, (wpc - c) * a)
    
        # h[l + 1] = 0.0
        # h[l + 2] = -1.0
        # h[l + 3] = 2.0 * wmc * a
        # h[l + 4] = (wpc - c) * a
        return h, m, gn, n
    end
    