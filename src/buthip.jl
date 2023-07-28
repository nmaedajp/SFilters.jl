function buthip(fp::Float64, fs::Float64, ap::Float64, as::Float64)
#
# BUTHIP.FOR to buthip.jl. 
# BUTHIP.FOR: M. Saito's program. (Saito(1978))
# return h, m, gn, n
# coded by chatGPT & N. Maeda on 20230723.
#
    pih = pi/2.0

    wp = max(abs(fp), abs(fs)) * pi
    ws = min(abs(fp), abs(fs)) * pi

    if ws == 0.0 || ws == wp || wp >= pih
        error("fp = $fp , fs = $fs. fp or fs is not correct.")
    end

    tp = tan(wp)
    ts = tan(ws)

    pa = min(abs(ap), abs(as))
    sa = max(abs(ap), abs(as))
    if pa == 0.0
        pa = 0.5
    end
    if sa == 0.0
        sa = 5.0
    end

    n = max(2, Int64(floor(abs(log(sa/pa) / log(tp/ts)) + 0.5)))
    cc = exp(log(pa * sa) / n) * tp * ts
    c = sqrt(cc)

    dp = pih / n
    m = n ÷ 2
    k = m * 4
    g = 1.0
    fj = 1.0
    c2 = -2.0 * (1.0 - c) * (1.0 + c)
    h = Float64[]
    for j in 1:4:k
        sj = cos(dp * fj)^2
        tj = sin(dp * fj)
        fj += 2.0
        a = 1.0 / ((c + tj)^2 + sj)
        g *= a
        push!(h,-2.0)
        push!(h, 1.0)
        push!(h, c2*a)
        push!(h,((c-tj)^2 + sj) * a)
#        H[J] = -2.0
#        H[J+1] = 1.0
#        H[J+2] = C2 * A
#        H[J+3] = ((C - TJ)^2 + SJ) * A
    end

    gn = g
    if n % 2 != 0
        m += 1
        gn = g / (1.0 + c)
        push!(h,-1.0)
        push!(h, 0.0)
        push!(h, (c - 1.0) / (1.0 + c))
        push!(h, 0.0)
    #
    #    H[K+1] = -1.0
    #    H[K+2] = 0.0
    #    H[K+3] = (C - 1.0) / (1.0 + C)
    #    H[K+4] = 0.0
    end
    return h, m, gn, n
end
