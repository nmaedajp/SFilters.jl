function recres(h::Vector{Float64}, gn::Float64, fm::Float64)
#     RECURSIVE FILTER FREQUENCY RESPONCE FUNCTION
#                                BY M.SAITO (DEC.13,1975)
#     ARGUMENTS
#        H      : COEFFICIENTS OF FILTER
#        M      : ORDER OF FILTER
#        GN     : GAIN FACTOR
#        FM     : MIN. FREQUENCY (NON-DIMENSIONAL)
#        DF     : STEP OF FREQUENCY ; FREQ = FM, FM+DF,...,FM+(N-1)DF
#        G      : POWER TRANSFER FUNCTION
#        P      : PHASE DELAY
#        N      : NUMBER OF G & P
#               
    k = length(h)
    m = div(length(h),4)
    if k != 4 * m
        error("recres: k=$k , m=$m. k must be 4*m.")
    end
    c = gn^2
    cs = cos(fm * 2pi)
    sn = sin(fm * 2pi)

    gg = c
    pp = 0.0
#    println(gg)
    for j = 1:4:k
        a = (h[j+1] + 1.0) * cs + h[j]
        b = (h[j+1] - 1.0) * sn
        gg = gg * (a^2 + b^2)
        if gg <= 0.0
           break
        end
        pp = pp + atan(b, a)
        a = (h[j+3] + 1.0) * cs + h[j+2]
        b = (h[j+3] - 1.0) * sn
        gg = gg / (a^2 + b^2)
        pp = pp - atan(b, a)
        if abs(pp) > pi
            pp = pp - sign(pp)*2pi
        end
#        println("j,gg,pp",j," ",gg," ",pp)
    end
    g = gg
    p = pp
    return g,p
end

function recres_s(h::Vector{Float64}, gn::Float64, fr::Vector{Float64})
    nfr = length(fr)
    gg=Array{Float64}(undef,nfr)
    pp=Array{Float64}(undef,nfr)
    for ifr = 1:nfr
        gg[ifr], pp[ifr] = recres(h, gn, fr[ifr])
    end
    return gg, pp
end
