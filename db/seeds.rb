# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

b_suige     = Brewer.create({ name: '酔鯨酒造' })
b_arimitsu  = Brewer.create({ name: '有光酒造場' })
b_tsukasa   = Brewer.create({ name: '司牡丹酒造' })
b_kikusui   = Brewer.create({ name: '菊水酒造' })
b_tosazuru  = Brewer.create({ name: '土佐鶴酒造' })
b_tosa      = Brewer.create({ name: '土佐酒造' })
b_nishioka  = Brewer.create({ name: '西岡酒造店' })
b_kouchi    = Brewer.create({ name: '高知酒造' })
b_kameizumi = Brewer.create({ name: '亀泉酒造' })
b_takagi    = Brewer.create({ name: '高木酒造' })
b_arisawa   = Brewer.create({ name: 'アリサワ' })
b_hamagawa  = Brewer.create({ name: '濱川商店' })
b_fujimusu  = Brewer.create({ name: '藤娘酒造' })
b_bunhon    = Brewer.create({ name: '文本酒造' })
b_mutemuka  = Brewer.create({ name: '無手無冠' })
b_matsuo    = Brewer.create({ name: '松尾酒造' })
b_minami    = Brewer.create({ name: '南酒造場' })

a_nihon   = Alcoholic.create({ name: '日本酒', item1: '辛さ', item2: '香り', item3: '飲みやすさ', item4: '味わい' })
a_wine    = Alcoholic.create({ name: 'ワイン', item1: '酸味', item2: '軽さ', item3: '甘さ' })
a_beel    = Alcoholic.create({ name: 'ビール', item1: 'のど越し', item2: '香り', item3: '飲みやすさ' })
a_cactel  = Alcoholic.create({ name: 'カクテル', item1: '香り', item2: '甘さ', item3: '飲みやすさ' })
a_syochu  = Alcoholic.create({ name: '焼酎', item1: '辛さ', item2: '香り', item3: '飲みやすさ', item4: '味わい' })
a_chuhai  = Alcoholic.create({ name: '酎ハイ', item1: '香り', item2: '甘さ', item3: '飲みやすさ' })
a_kajitsu = Alcoholic.create({ name: '果実酒', item1: '香り', item2: '甘さ', item3: '飲みやすさ' })

dr_tosazuru = Drink.create({ name: '土佐鶴', alcohol: 15, detail: '金賞', alcoholic: a_nihon, brewer: b_tosazuru })
dr_keigetsu = Drink.create({ name: '桂月', alcohol: 15, detail: '微妙', alcoholic: a_nihon, brewer: b_tosa })
dr_minami   = Drink.create({ name: '南', alcohol: 15, detail: 'すばらしい', alcoholic: a_nihon, brewer: b_minami })
dr_kurokiri = Drink.create({ name: '黒霧島', alcohol: 20, detail: 'あじわいいい', alcoholic: a_syochu })
dr_kasiore  = Drink.create({ name: 'カシスオレンジ', alcohol: 8, detail: 'すっきりした甘み', alcoholic: a_cactel })
dr_makaihe  = Drink.create({ name: '魔界への誘い', alcohol: 37, detail: '味わい深い', alcoholic: a_syochu })

di_katsuo_t  = Dish.create({ name: 'かつおのたたき', detail: 'かつおは高知県の県魚です。土佐の地域ならでは味覚を堪能できる奥の深さのある料理です。' })
di_utsubo_k  = Dish.create({ name: 'ウツボの唐揚げ', detail: 'うつぼは見た目がグロテスクで気性の荒い生き物ですが、太平洋側でよく食されている。皮のコリコリが特徴的です。' })
di_sabasushi = Dish.create({ name: '鯖の姿寿司', detail: '皿鉢料理の組みものの中心に守る定番の姿ずしです。鯖を背開きにして塩を聞かせ、柚子の酢で締めます。' })

m_harimaya        = Municipality.create({ name: 'はりまや町' })
m_kami_tosayamada = Municipality.create({ name: '香美市土佐山田町' })
m_shimanto        = Municipality.create({ name: '四万十市' })

s_ippu     = Store.create({
  name: '土佐の一風',
  address: '高知県高知市はりまや町1-6-1',
  email: 'ippu@example.com',
  password: 'ippupass',
  phone_number: '088-855-9640',
  budget: 3500,
  detail: '高知県の旬な料理を提供します',
  business_day: '不定休',
  business_time: '17:00〜23:00（ラストオーダー/22:00)',
  transportation: 'お車でJR高知駅から5分',
  seat: 20,
  room: 10,
  banquet_hall: false,
  banquet_hall_capacity: 0,
  smoking: 5,
  hp: 'http://www.ipphu.com/access/',
  municipality_id: m_harimaya.id
})

s_bunzo   = Store.create({
  name: '文蔵',
  address: '高知県香美市土佐山田町西本町1-4-32',
  email: 'bunzo@example.com',
  password: 'bunzopass',
  phone_number: '0887-53-3055',
  budget: 4500,
  detail: '高知県の旬な料理を提供します',
  business_day: '無休',
  business_time: '11:00～14:30(L.O.14:00)、17:00～23:00(L.O.22:00)',
  transportation: '土佐山田駅から113m',
  seat: 20,
  room: 10,
  banquet_hall: false,
  banquet_hall_capacity: 0,
  smoking: 5,
  hp: 'https://www.facebook.com/bunzo.bunkajin',
  municipality_id: m_kami_tosayamada.id
})

u_testuser1 = User.create({ name: 'tester1', email: 'tester1@email.com', password: 'tester1pass' })
u_testuser2 = User.create({ name: 'tester2', email: 'tester2@email.com', password: 'tester2pass' })

r_katsura   = Resort.create({ name: '桂浜', address: '高知県高知市浦戸183-1', detail: '高知県を代表する景勝地のひとつ。近くには龍馬記念館もある。' })
r_ryugado   = Resort.create({ name: '龍河洞', address: '高知県香美市土佐山田町逆川1424', detail: '日本の代表的観光鍾乳洞。幻想的で神秘的な世界を体感できる。' })
r_wakamiya  = Resort.create({ name: '若宮八幡宮', address: '高知長浜6600', detail: '長宗我部元親公出陣祈願の社。高知市港南区の総氏神、また厄除け開運の神などとして近郷近在の里人から広く信仰を集めている。' })
r_muroto    = Resort.create({ name: '室戸岬', address: '高知県室戸市室戸岬町', detail: '壮大な岩、荒々しい海、空海が残した数々の伝説、パワースポットなど盛りだくさん！'} )

s_ippu.have_drinks << dr_tosazuru
s_ippu.have_drinks << dr_keigetsu
