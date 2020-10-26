def reset_id(tablenames)
  connection = ActiveRecord::Base.connection
  tablenames.each do |tablename|
    connection.execute("select setval('#{tablename}_id_seq',(select max(id) from #{tablename}))")
  end
end

Report.destroy_all
Recipe.destroy_all
Food.destroy_all
User.destroy_all
Brand.destroy_all
Rank.destroy_all
Company.destroy_all

companyA = Company.create!(id: 1, email: "test@test", name:"株式会社テスト",password: "test@test")
companyB = Company.create!(id: 2, email: "bbb@bbb", name:"株式会社BBB",password: "bbb@bbb")
companyC = Company.create!(id: 3, email: "ccc@ccc", name:"株式会社CCC",password: "ccc@ccc")
puts "companyOK"
# A社
rank1 = companyA.ranks.create!(id: 1,name: "なし")
rank2 = companyA.ranks.create!(id: 2, name: "一般")
rank3 = companyA.ranks.create!(id: 3, name: "店長")
rank4 = companyA.ranks.create!(id: 4,name: "マネージャー")
rank5 = companyA.ranks.create!(id: 5,name: "課長")
rank6 = companyA.ranks.create!(id: 6,name: "部長")
# B社
rank7 = companyB.ranks.create!(id: 7,name: "アルバイト" )
rank8 = companyB.ranks.create!(id: 8,name: "社員" )
rank9 = companyB.ranks.create!(id: 9,name: "なし" )
# C社
rank10 = companyC.ranks.create!(id: 10,name: "アルバイト責任者" )
rank11 = companyC.ranks.create!(id: 11,name: "責任者" )
rank12 = companyC.ranks.create!(id: 12,name: "オーナー")
puts "rankOK"
# A社
brand1 = companyA.brands.create!(id: 1,name:"パスタ屋" )
brand2 = companyA.brands.create!(id: 2,name:"健康食" )
brand3 = companyA.brands.create!(id: 3,name:"カレー屋" )
brand4 = companyA.brands.create!(id: 4,name:"焼肉屋" )
brand5 = companyA.brands.create!(id: 5,name:"ハンバーグ屋" )
# B社
brand6 = companyB.brands.create!(id: 6,name:"ハンバーグ屋" )
# C社
brand7 = companyC.brands.create!(id: 7,name:"自然食販売" )
puts "brandOK"
# A社
userA = rank1.users.create!(id:1, name:"田中",employee_id:"0001")
userB = rank1.users.create!(id:2, name:"鈴木", employee_id:"0002")
userC = rank2.users.create!(id:3, name:"山田", employee_id:"0003")
userD = rank2.users.create!(id:4, name:"神保", employee_id:"0004")
userE = rank3.users.create!(id:5, name:"木村", employee_id:"0005")
userF = rank3.users.create!(id:6, name:"山口", employee_id:"0006")
userG = rank4.users.create!(id:7, name:"山木", employee_id:"0007")
userH = rank4.users.create!(id:8, name:"大石", employee_id:"0008")
userI = rank5.users.create!(id:9, name:"石川", employee_id:"0009")
userJ = rank5.users.create!(id:10, name:"西", employee_id:"0010")
# B社
userK = rank7.users.create!(id:11, name:"渡辺", employee_id:"01")
userL = rank8.users.create!(id:12, name:"佐藤", employee_id:"02")
# C社
userM = rank10.users.create!(id:13, name:"島田", employee_id:"001")
puts "userOK"

# A社
shopA = brand1.shops.create!(id: 1,name: "パスタ屋A店", number: 1001)
shopB = brand1.shops.create!(id: 2,name: "パスタ屋B店", number: 1002)
shopC = brand2.shops.create!(id: 3,name: "健康食A店", number: 2001)
shopD = brand2.shops.create!(id: 4,name: "健康食B店", number: 2002)
shopE = brand3.shops.create!(id: 5,name: "カレー屋A店", number: 3001)
shopF = brand3.shops.create!(id: 6,name: "カレー屋B店", number: 3002)
shopG = brand4.shops.create!(id: 7,name: "焼肉屋A店", number:4001)
shopH = brand5.shops.create!(id: 8,name: "ハンバーグ屋A店", number: 5001)
shopI = brand5.shops.create!(id: 9,name: "ハンバーグ屋B店", number: 5002)
# B社
shopJ = brand6.shops.create!(id: 10,name: "ハンバーグ屋A店", number:3001)
shopK = brand6.shops.create!(id: 11,name: "ハンバーグ屋B店", number:3002)
# C社
shopL = brand7.shops.create!(id: 12,name: "自然食販売A店", number: 3003)
shopM = brand7.shops.create!(id: 13,name: "自然食販売B店", number: 3004)
puts "shopOK"
# A社
foodA = companyA.foods.create!(id: 1, name: "ナス",total:500 ,unit:"g" )
foodB = companyA.foods.create!(id: 2, name: "玉ねぎ",total:200 ,unit:"g" )
foodC = companyA.foods.create!(id: 3, name: "しめじ",total:300 ,unit:"g" )
foodD = companyA.foods.create!(id: 4, name: "デミグラス",total:1000 ,unit:"ml" )
foodE = companyA.foods.create!(id: 5, name: "牛乳",total:1000 ,unit:"ml" )
foodF = companyA.foods.create!(id: 6, name: "ケチャップ",total:3000 ,unit:"g" )
foodG = companyA.foods.create!(id: 7, name: "ハンバーグ",total:18 ,unit:"枚" )
foodH = companyA.foods.create!(id: 8, name: "コロッケ",total:30 ,unit:"枚" )
foodJ = companyA.foods.create!(id: 9, name: "生クリーム",total:1000 ,unit:"pc" )
# B社
foodI = companyB.foods.create!(id: 10, name: "ナス",total: 100,unit:"g" )
foodK = companyB.foods.create!(id: 11, name: "生クリーム",total:1000 ,unit:"pc" )
# C社
foodL = companyC.foods.create!(id: 12, name: "イチゴ",total: 30,unit:"粒" )
foodL = companyC.foods.create!(id: 13, name: "レモン",total: 1,unit:"個" )
puts "foodOK"

# A社
recipeA = brand1.recipes.create!(id: 1, name: "カルボ")
recipeB = brand1.recipes.create!(id: 2, name: "ミート")
recipeC = brand1.recipes.create!(id: 3, name: "トマトソース")
recipeD = brand1.recipes.create!(id: 4, name: "ペペロンチーノ")
recipeE = brand1.recipes.create!(id: 5, name: "醤油バターパスタ")
recipeF = brand1.recipes.create!(id: 6, name: "ビスク")
recipeG = brand1.recipes.create!(id: 7, name: "春野菜のパスタ")
recipeH = brand1.recipes.create!(id: 8, name: "スープスパ")
recipeI = brand1.recipes.create!(id: 9, name: "クリーム")
recipeJ = brand1.recipes.create!(id: 10, name: "アーリオ•O")

recipeK = brand2.recipes.create!(id: 11, name: "魚定食")

recipeL = brand3.recipes.create!(id: 12, name: "チキンカレー")
# B社
recipeM = brand6.recipes.create!(id: 13, name: "ハンバーグプレート")
recipeN = brand6.recipes.create!(id: 14, name: "おろしバーグ")
# C社
recipeO = brand7.recipes.create!(id: 15, name: "有機野菜定食A")
recipeP = brand7.recipes.create!(id: 16, name: "豆腐湯葉御膳")
puts "recipeOK"
# A社
# 1~10までどれでもOK、レシピはJまで
food_recipeA =  recipeA.food_recipes.create!(id: 1,  food_id: 1, amount: 20 )
food_recipeB =  recipeA.food_recipes.create!(id: 2,  food_id: 2, amount: 20 )
food_recipeC =  recipeA.food_recipes.create!(id: 3,  food_id: 3, amount: 20 )

food_recipeD =  recipeB.food_recipes.create!(id: 4,  food_id: 1, amount: 10 )
food_recipeE =  recipeB.food_recipes.create!(id: 5,  food_id: 2, amount: 50 )
food_recipeF =  recipeB.food_recipes.create!(id: 6,  food_id: 3, amount: 10 )
food_recipeG =  recipeB.food_recipes.create!(id: 7,  food_id: 4, amount: 5 )
  
food_recipeH =  recipeC.food_recipes.create!(id: 8,  food_id: 5, amount: 30 )
food_recipeI =  recipeC.food_recipes.create!(id: 9,  food_id: 6, amount: 1 )
food_recipeJ =  recipeC.food_recipes.create!(id: 10, food_id: 7, amount: 2 )
  
food_recipeK =  recipeD.food_recipes.create!(id: 11, food_id: 7, amount: 2 )
food_recipeL =  recipeD.food_recipes.create!(id: 12, food_id: 8, amount: 20 )
food_recipeM =  recipeD.food_recipes.create!(id: 13, food_id: 9, amount: 10 )
  
food_recipeN =  recipeE.food_recipes.create!(id: 14, food_id: 9, amount: 10 )
food_recipeO =  recipeE.food_recipes.create!(id: 15, food_id: 1, amount: 10 )
food_recipeQ =  recipeE.food_recipes.create!(id: 16, food_id: 2, amount: 10 )
  
food_recipeR =  recipeF.food_recipes.create!(id: 17, food_id: 1, amount: 10 )
food_recipeS =  recipeF.food_recipes.create!(id: 18, food_id: 2, amount: 10 )
food_recipeT =  recipeF.food_recipes.create!(id: 19, food_id: 3, amount: 10 )

food_recipeU =  recipeG.food_recipes.create!(id: 20, food_id: 1, amount: 10 )
food_recipeV =  recipeG.food_recipes.create!(id: 21, food_id: 2, amount: 10 )
food_recipeW =  recipeG.food_recipes.create!(id: 22, food_id: 3, amount: 10 )

food_recipeX =  recipeH.food_recipes.create!(id: 23, food_id: 4, amount: 10 )
food_recipeY =  recipeH.food_recipes.create!(id: 24, food_id: 5, amount: 10 )
food_recipeZ =  recipeH.food_recipes.create!(id: 25, food_id: 6, amount: 10 )

food_recipeAA = recipeI.food_recipes.create!(id: 26, food_id: 4, amount: 10 )
food_recipeAB = recipeI.food_recipes.create!(id: 27, food_id: 7, amount: 10 )
food_recipeAC = recipeI.food_recipes.create!(id: 28, food_id: 8, amount: 10 )

food_recipeAD = recipeJ.food_recipes.create!(id: 29, food_id: 8, amount: 10 )
food_recipeAE = recipeJ.food_recipes.create!(id: 30, food_id: 9, amount: 10 )
food_recipeAF = recipeJ.food_recipes.create!(id: 31, food_id: 1, amount: 10 )
# B2社
food_recipeAG = recipeK.food_recipes.create!(id: 32, food_id: 10, amount: 100 )
# C社
food_recipeAH = recipeL.food_recipes.create!(id: 33, food_id: 12, amount: 30 )
puts "food_recipeOK"
# A社
# userA(1)~J(10)、shopA(1)~H(9)まで 
reportA = shopA.reports.create!(id: 1 ,date: '2020-09-11',sale: 101 ,user_id: 1,  shop_id:1)
reportB = shopA.reports.create!(id: 2 ,date: '2020-09-12',sale: 123 ,user_id: 2,  shop_id:1)
reportC = shopA.reports.create!(id: 3 ,date: '2020-09-13',sale: 146 ,user_id: 2,  shop_id:1)
reportD = shopA.reports.create!(id: 4 ,date: '2020-09-14',sale: 136 ,user_id: 3,  shop_id:1)
reportE = shopA.reports.create!(id: 5 ,date: '2020-09-15',sale: 137 ,user_id: 5,  shop_id:1)
reportF = shopA.reports.create!(id: 6 ,date: '2020-09-16',sale: 182 ,user_id: 6,  shop_id:1)
reportG = shopA.reports.create!(id: 7 ,date: '2020-09-17',sale: 103 ,user_id: 7,  shop_id:1)
reportH = shopA.reports.create!(id: 8 ,date: '2020-09-18',sale: 135 ,user_id: 8,  shop_id:1)
reportI = shopI.reports.create!(id: 9 ,date: '2020-09-19',sale: 122 ,user_id: 9,  shop_id:2)
reportJ = shopI.reports.create!(id: 10,date: '2020-09-20',sale: 110 ,user_id: 10, shop_id:2)

# B社
reportK = shopJ.reports.create!(id: 11,date: '2020-09-01',sale: 109,user_id: 11, shop_id:10)
# C社
reportL = shopL.reports.create!(id: 12,date: '2020-09-01',sale: 110,user_id: 13, shop_id:12)
puts "reportOK"

# A社
# recipeA(1)~J(10)がブランドA
# brandA
orderA = recipeA.orders.create!(id:  1,count: 10, report_id:1)
orderB = recipeB.orders.create!(id:  2,count: 12, report_id:1)
orderC = recipeC.orders.create!(id:  3,count: 9, report_id: 1)
orderD = recipeD.orders.create!(id:  4,count: 8, report_id: 1)
orderE = recipeE.orders.create!(id:  5,count: 13, report_id:1)
orderF = recipeF.orders.create!(id:  6,count: 6, report_id: 1)
orderG = recipeG.orders.create!(id:  7,count: 4, report_id: 2)
orderH = recipeH.orders.create!(id:  8,count: 7, report_id: 2)
orderI = recipeI.orders.create!(id:  9,count: 3, report_id: 2)
orderJ = recipeJ.orders.create!(id: 10,count: 1, report_id: 2)
# brand2
orderK = recipeK.orders.create!(id: 11,count: 8, report_id: 11)
# brand3
orderL = recipeL.orders.create!(id: 12,count: 5, report_id: 12)
puts "orderOK"

tablenames = %w[companies ranks users brands shops recipes food_recipes foods orders reports]
reset_id(tablenames)
