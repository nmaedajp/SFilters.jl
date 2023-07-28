function recfil(x,h,nml)
    n = length(x)
    y = Array{Float64}(undef,n)
    if nml >=0
        j=1; jd=1
    else
        j=n; jd=-1
    end
    a = h[1]; aa = h[2]
    b = h[3]; bb = h[4]
    u1 = 0.0; u2 = 0.0
    v1 = 0.0; v2 = 0.0
    for i=1:n
        u3 = u2; u2 = u1; u1 = x[j]
        v3 = v2; v2 = v1
        v1 = u1 +a*u2 +aa*u3 -b*v2 -bb*v3
        y[j]=v1 
        j=j+jd
    end
    return y
end
