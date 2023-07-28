function btflhc(wavein,fp,fs,hz,ndr)
    fpnd = fp/hz; fsnd = fs/hz
    ap = 0.0; as = 0.0

    h, m, gn, n = butlop(fpnd, fsnd, ap, as)

    if ndr == 0
        waveout = tandem(wavein,  h,  1) * gn
        waveout = tandem(waveout, h, -1) * gn
    end
    if ndr > 0
        waveout = tandem(wavein, h, 1) * gn
    end
    if ndr < 0
        waveout = tandem(wavein, h, -1) * gn
    end
    return waveout
end