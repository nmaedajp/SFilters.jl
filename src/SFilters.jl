module SFilters

using RdWaveFiles
using FFTGrp

export tandem, recfil, recres, recres_s
export buthip, butlop, butpas, btfllc, btflhc, btbdp
export bandpass, dwsamp, lowcut

include("tandem.jl")
include("recfil.jl")
include("recres.jl")

include("buthip.jl")
include("butlop.jl")
include("butpas.jl")

include("btfllc.jl")
include("btflhc.jl")
include("btbdp.jl")

include("dwsamp.jl")
include("bandpass.jl")
include("lowcut.jl")

end
