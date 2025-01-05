function btbdp(wavein, fl, fh, fs, hz, ndr)
    flnd = fl/hz;  fhnd = fh/hz; fsnd = fs/hz
    ap = 0.0; as = 0.0

    h, m, gn, n = butpas(flnd, fhnd, fsnd, ap, as)

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
