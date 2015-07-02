class PagesController < ApplicationController
  def about
  end

  def error
  end

  def home
    @fuel_types = ["regular", "midgrade", "premium"]
    @codes =
  ["ABE","ABI","ABQ","ABR","ABY","ACB","ACK","ACT","ACV","ACY","ADK","ADQ","AEX","AFM",
  "AGC","AGN","AGS","AHN","AIA","AID","AIY","AIZ","AKN","AKP","AKW","ALB","ALM",
  "ALN","ALO","ALS","ALW","AMA","ANB","ANC","AND","ANI","AOO","APF","APN","AQH","AQT",
  "ART","ASE","ASN","AST","ATK","ATL","ATW","ATY","AUG","AUK","AUS","AVL","AVP","AWI",
  "AXN","AZO","BAF","BAK","BCE","BDE","BDL","BDR","BED","BEH","BET","BFD","BFF","BFI",
  "BFL","BGM","BGR","BHB","BHM","BID","BIG","BIL","BIS","BJI","BKL","BKW","BKX","BLI",
  "BLM","BLV","BMG","BMI","BNA","BOI","BOS","BPK","BPT","BQK","BQN","BRD","BRL","BRO",
  "BRW","BTI","BTL","BTM","BTR","BTV","BUF","BUR","BVK","BWG","BWI","BZN","CAE","CAK","CCR",
  "CDB","CDC","CDV","CDW","CEC","CEF","CEZ","CFK","CGA","CGF","CGI","CGX","CHA","CHO","CHS",
  "CIC","CID","CIU","CKB","CLE","CLL","CLM","CLT","CMH","CMI","CMX","CNM","CNY","COD",
  "COE","COS","COU","CPR","CPX","CRP","CRQ","CRW","CSG","CVG","CVO","CVX","CWA","CWI",
  "CYS","D76","DAB","DAL","DAN","DAY","DBQ","DCA","DDC","DDH","DEC","DEN","DET","DFW",
  "DHN","DIK","DLG","DLH","DNV","DRO","DRT","DSM","DTW","DUJ","DUT","DUY","DVL",
  "DVT","DXR","EAR","EAT","EAU","EEK","EEN","EFD","EFK","EGE","EKM","EKO","ELI","ELM",
  "ELO","ELP","ELY","ENA","ENM","ENW","ERI","ESC","ESF","EUG","EVV","EWB","EWN","EWR",
  "EWU","EYW","FAI","FAQ","FAR","FAT","FAY","FHR","FHU","FKL","FLG","FLL","FLO","FMN",
  "FNL","FNT","FOD","FOE","FRG","FRM","FSD","FSM","FTW","FWA","FYU","FYV","GAL",
  "GAM","GBD","GBH","GCC","GCK","GCN","GED","GEG","GFK","GFL","GGG","GGV","GGW","GJT","GKN","GLD","GLH",
  "GLR","GLS","GNV","GON","GPI","GPT","GPZ","GRB","GRI","GRK","GRO","GRR","GSN","GSO",
  "GSP","GST","GTF","GTR","GUC","GUM","GUP","GYH","GYR","GYY","HDN","HFD","HGR","HIB",
  "HII","HKS","HKY","HLA","HLN","HND","HNH","HNL","HNM","HNS","HOB","HOM","HON","HOT",
  "HOU","HPB","HPN","HRL","HRO","HSL","HSV","HTS","HUF","HUT","HVN","HXD","HYA","HYL","HYS",
  "IAD","IAH","IAN","ICT","IDA","IFP","IGM","IIK","ILE","ILG","ILI","ILL","ILM","IMT",
  "IND","INL","INT","IPL","IPT","IRK","ISN","ISO","ISP","ITH","ITO","IWA","IWD","IXD","IYK",
  "JAC","JAN","JAX","JBR","JEF","JFK","JHW","JLN","JMS","JNU","JRB","JST","JVL","JXN",
  "KAE","KAL","KDK","KEB","KKA","KLG","KOA","KSM","KTB","KTN","KVC","KVL","KWT","LAA",
  "LAF","LAL","LAN","LAR","LAS","LAW","LAX","LBB","LBE","LBF","LBL","LBX","LCH",
  "LCK","LEB","LEX","LFT","LGA","LGB","LHD","LIH","LIT","LMT","LNK","LNS","LNY","LPR",
  "LRD","LRU","LSE","LUK","LWB","LWS","LYH","MAF","MAZ","MBA","MBL","MBS","MCC","MCE",
  "MCG","MCI","MCK","MCN","MCO","MCW","MDH","MDM","MDT","MDW","MDY","MEI","MEM","MFD",
  "MFE","MFR","MGM","MGW","MHE","MHK","MHT","MIA","MIE","MIV","MJX","MKC","MKE","MKG",
  "MKK","MKL","MKT","MLB","MLI","MLL","MLU","MMH","MMU","MMV","MNM","MOB",
  "MOD","MOT","MOU","MPV","MQI","MQJ","MQY","MRI","MRY","MSL","MSN","MSO","MSP","MSS",
  "MSV","MSY","MTH","MTJ","MTM","MTO","MUE","MVL","MVN","MVY","MWA","MWH","MYR","MZJ",
  "N93","NEW","NQA","NUL","OAJ","OAK","OCF","OFK","OGD","OGG","OGS","OKC","OLM","OMA",
  "OME","ONP","ONT","OOK","OQU","ORD","ORF","ORH","ORI","ORS","ORV","OSH","OSU","OTG",
  "OTH","OTM","OTZ","OWB","OXC","OXR","PAE","PAH","PBI","PCW","PDT","PDX","PFN","PGA",
  "PGD","PGM","PGV","PHF","PHL","PHO","PHX","PIA","PIB","PIE","PIH","PIR","PIT","PKB",
  "PLB","PLK","PLN","PMD","PNC","PNS","POU","PPC","PPG","PQI","PQL","PRB","PRC","PSC","PSE",
  "PSG","PSM","PSP","PTH","PTK","PUB","PUW","PVC","PVD","PVU","PWM","PWT","RAP","RDD","RDG",
  "RDM","RDU","RFD","RHI","RIC","RIW","RKD","RKS","RME","RMG","RNO","ROA","ROC","ROW","RSH",
  "RST","RSW","RUT","RWI","SAF","SAN","SAT","SAV","SAW","SBA","SBD","SBN","SBP","SBY",
  "SCC","SCK","SCM","SDF","SDP","SDY","SEA","SFB","SFO","SFZ","SGF","SGH","SGJ","SGU",
  "SGY","SHD","SHG","SHH","SHR","SHV","SIG","SIT","SJC","SJT","SJU","SKX","SLC","SLE",
  "SLK","SLN","SMF","SMX","SNA","SNP","SOP","SOV","SOW","SPI","SPS","SQI","SRQ","SRR","STC",
  "STJ","STL","STP","STS","STT","STX","SUN","SUS","SUX","SVA","SVC","SWF","SWO","SYR","T44",
  "TAL","TBN","TCL","TEB","TEX","TIX","TLH","TLT","TNI","TOG","TOL","TPA","TPL","TRI",
  "TTN","TUL","TUP","TUS","TVC","TVF","TVL","TVR","TWF","TXK","TYR","TYS","UCA","UIN","UNK",
  "UNV","UOX","UUU","VAK","VCT","VCV","VDZ","VGT","VIS","VLD","VPS","VPZ","VQQ","VQS",
  "VRB","WBB","WDG","WLK","WNA","WRG","WRL","WST","WTK","WWD","WYS","X44",
  "X95","XNA","YAK","YKM","YKN","YNG","YUM"]
  end
end
