s = "NNCB"
# s = "VNVVKSNNFPBBBVSCVBBC"

mapping = {
  "CH" => "B",
  "HH" => "N",
  "CB" => "H",
  "NH" => "C",
  "HB" => "C",
  "HC" => "B",
  "HN" => "C",
  "NN" => "C",
  "BH" => "H",
  "NC" => "B",
  "NB" => "B",
  "BN" => "B",
  "BB" => "N",
  "BC" => "B",
  "CC" => "N",
  "CN" => "C"
}

# mapping = {
#   "SV" => "C",
#   "SF" => "P",
#   "BP" => "V",
#   "HC" => "B",
#   "PK" => "B",
#   "NF" => "C",
#   "SN" => "N",
#   "PF" => "S",
#   "ON" => "S",
#   "FC" => "C",
#   "PN" => "P",
#   "SC" => "B",
#   "KS" => "V",
#   "OS" => "S",
#   "NC" => "C",
#   "VH" => "N",
#   "OH" => "C",
#   "BB" => "H",
#   "KV" => "V",
#   "HP" => "S",
#   "CP" => "H",
#   "SO" => "F",
#   "KK" => "N",
#   "OO" => "C",
#   "SH" => "O",
#   "PB" => "S",
#   "KP" => "H",
#   "OC" => "K",
#   "BN" => "F",
#   "HH" => "S",
#   "CH" => "B",
#   "PC" => "V",
#   "SB" => "N",
#   "KO" => "H",
#   "BH" => "B",
#   "SK" => "K",
#   "KF" => "S",
#   "NH" => "O",
#   "HN" => "V",
#   "VN" => "F",
#   "BC" => "V",
#   "VP" => "C",
#   "KN" => "H",
#   "PV" => "S",
#   "HB" => "V",
#   "VV" => "O",
#   "PO" => "B",
#   "FN" => "H",
#   "PP" => "B",
#   "BF" => "S",
#   "CB" => "S",
#   "NK" => "F",
#   "NO" => "B",
#   "CC" => "S",
#   "OF" => "C",
#   "HS" => "H",
#   "SP" => "C",
#   "VB" => "V",
#   "BK" => "S",
#   "CO" => "O",
#   "NS" => "K",
#   "PH" => "O",
#   "BV" => "B",
#   "CK" => "F",
#   "VC" => "S",
#   "HK" => "B",
#   "BO" => "K",
#   "HV" => "F",
#   "KC" => "V",
#   "CN" => "H",
#   "FS" => "V",
#   "VS" => "N",
#   "CF" => "K",
#   "VO" => "F",
#   "FH" => "H",
#   "NB" => "N",
#   "PS" => "P",
#   "OK" => "N",
#   "CV" => "O",
#   "CS" => "K",
#   "HO" => "C",
#   "KB" => "P",
#   "NN" => "V",
#   "KH" => "C",
#   "OB" => "V",
#   "BS" => "O",
#   "FB" => "H",
#   "FF" => "K",
#   "HF" => "P",
#   "FO" => "F",
#   "VF" => "F",
#   "OP" => "S",
#   "VK" => "K",
#   "OV" => "N",
#   "FK" => "H",
#   "FP" => "H",
#   "NV" => "H",
#   "NP" => "N",
#   "SS" => "C",
#   "FV" => "N"
# }


(0..10-1).each{|j|
  s = s[0] + (0..s.length-2).map{|i|
    m = mapping["#{s[i]}#{s[i+1]}"]

    "#{m}#{s[i+1]}"
  }.join
}

x = s.chars.tally.invert

max = x.keys.max
min = x.keys.min

p max-min



def group_by_pairs s
  n = []
  (0..s.length-2).map{|i|
    n << [s[i], s[i+1]]
  }
  n
end

