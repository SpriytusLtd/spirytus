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

d_tosazuru = Drink.create({ name: '土佐鶴', alcohol: 15, detail: '金賞', alcoholic: a_nihon, brewer: b_tosazuru })
d_keigetsu = Drink.create({ name: '桂月', alcohol: 15, detail: '微妙', alcoholic: a_nihon, brewer: b_tosa })
d_minami   = Drink.create({ name: '南', alcohol: 15, detail: 'すばらしい', alcoholic: a_nihon, brewer: b_minami })
d_kurokiri = Drink.create({ name: '黒霧島', alcohol: 20, detail: 'あじわいいい', alcoholic: a_syochu })
d_kasiore  = Drink.create({ name: 'カシスオレンジ', alcohol: 8, detail: 'すっきりした甘み', alcoholic: a_cactel })
d_makaihe  = Drink.create({ name: '魔界への誘い', alcohol: 37, detail: '味わい深い', alcoholic: a_syochu })

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
  hp: 'http://www.ipphu.com/access/'
})
