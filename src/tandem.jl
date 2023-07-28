function tandem(x::Vector{Float64}, h::Vector{Float64}, nml::Int)
    n = length(x); m = div(length(h),4)
    if n <= 0
        error("tandem: n=$n.  n must be positive.")
    end
    if  length(h) != 4*m
        println("length(h): ", length(h))
        error("tandem: m=$m. length(h) must be 4*m.")
    end
#
    y = recfil(x, h[1:4], nml)
    if m > 1
        for i in 2:m
            y = recfil(y, h[4*i-3:4*i], nml)
        end
    end
    return y
end