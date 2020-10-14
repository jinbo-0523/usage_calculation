FoodRecipe.destroy_all
Recipe.destroy_all
Company.destroy_all


companyA = Company.create!(id: 1, email: "aaa@aaa", name:"株式会社AAA",password: "aaa@aaa")
companyB = Company.create!(id: 2, email: "bbb@bbb", name:"株式会社BBB",password: "bbb@bbb")
companyC = Company.create!(id: 3, email: "ccc@ccc", name:"株式会社CCC",password: "ccc@ccc")


rank1 = companyA.ranks.create!(id: 1,name: "なし")
rank2 = companyA.ranks.create!(id: 2, name: "一般")
rank3 = companyA.ranks.create!(id: 3, name: "店長")
rank4 = companyA.ranks.create!(id: 4,name: "マネージャー")
rank5 = companyA.ranks.create!(id: 5,name: "課長")
rank6 = companyA.ranks.create!(id: 6,name: "部長")
rank7 = companyB.ranks.create!(id: 7,name: "アルバイト" )
rank8 = companyB.ranks.create!(id: 8,name: "社員" )
rank9 = companyB.ranks.create!(id: 9,name: "なし" )
rank10 = companyC.ranks.create!(id: 10,name: "アルバイト責任者" )
rank11 = companyC.ranks.create!(id: 11,name: "責任者" )
rank12 = companyC.ranks.create!(id: 12,name: "オーナー")

brand1 = companyA.brands.create!(id: 1,name:"パスタ屋" )
brand2 = companyA.brands.create!(id: 2,name:"健康食" )
brand3 = companyB.brands.create!(id: 3,name:"健康食" )
brand4 = companyB.brands.create!(id: 4,name:"カレー屋" )
brand5 = companyC.brands.create!(id: 5,name:"焼肉屋" )
brand6 = companyC.brands.create!(id: 6,name:"ハンバーグ屋" )
brand7 = companyC.brands.create!(id: 7,name:"自然食販売" )


userA = rank1.users.create!(id:1, name:"たけ",employee_id:"0001")
userB = rank3.users.create!(id:2, name:"かみさと", employee_id:"0002")
userC = rank5.users.create!(id:3, name:"あかね", employee_id:"0003")
userD = rank6.users.create!(id:4, name:"じんぼ", employee_id:"0004")

userE = rank7.users.create!(id:5, name:"けいすけ", employee_id:"1111")
userF = rank8.users.create!(id:6, name:"たいち", employee_id:"2222")
userG = rank9.users.create!(id:7, name:"タツキ", employee_id:"3333")
userH = rank7.users.create!(id:8, name:"たくみ", employee_id:"4444")

userI = rank10.users.create!(id:9, name:"あやね", employee_id:"1")
userJ = rank11.users.create!(id:10, name:"ひろや", employee_id:"2")
userK = rank12.users.create!(id:11, name:"いっこう", employee_id:"3")
userL = rank10.users.create!(id:12, name:"たくみ", employee_id:"4")
userM = rank11.users.create!(id:13, name:"たくみ", employee_id:"5")
# userN = rank11.users.create!(id:14, name:"たくみ", employee_id:"5")




shopA = brand1.shops.create!(id: 1,name: "パスタ屋A店", number: 1001)
shopB = brand1.shops.create!(id: 2,name: "パスタ屋B店", number: 1002)
shopC = brand2.shops.create!(id: 3,name: "健康食A店", number: 2001)
shopD = brand2.shops.create!(id: 4,name: "健康食B店", number: 2002)

shopE = brand3.shops.create!(id: 5,name: "健康食A店", number: 1001)
shopF = brand3.shops.create!(id: 6,name: "健康食B店", number: 2)
shopG = brand4.shops.create!(id: 7,name: "カレー屋A店", number:3)
shopH = brand5.shops.create!(id: 8,name: "焼肉屋A店", number: 4)

shopI = brand6.shops.create!(id: 9,name: "ハンバーグ屋A店", number:3001)
shopJ = brand6.shops.create!(id: 10,name: "ハンバーグ屋B店", number:3002)
shopK = brand7.shops.create!(id: 11,name: "自然食販売A店", number: 3003)
shopL = brand7.shops.create!(id: 12,name: "自然食販売B店", number: 3004)


foodA = companyA.foods.create!(id: 1, name: "ナス",total:500 ,unit:"g" )
foodB = companyA.foods.create!(id: 2, name: "玉ねぎ",total:200 ,unit:"g" )
foodC = companyA.foods.create!(id: 3, name: "しめじ",total:300 ,unit:"g" )
foodD = companyA.foods.create!(id: 4, name: "デミグラスソース",total:1000 ,unit:"ml" )

foodE = companyB.foods.create!(id: 5, name: "ナス",total:500 ,unit:"g" )
foodF = companyB.foods.create!(id: 6, name: "ケチャップ",total:3000 ,unit:"g" )
foodG = companyB.foods.create!(id: 7, name: "ハンバーグ",total:18 ,unit:"枚" )
foodH = companyB.foods.create!(id: 8, name: "コロッケ",total:30 ,unit:"枚" )

foodI = companyC.foods.create!(id: 9, name: "ナス",total: 100,unit:"g" )
foodJ = companyC.foods.create!(id: 10, name: "牛乳",total:1000 ,unit:"pc" )
foodK = companyC.foods.create!(id: 11, name: "生クリーム",total:1000 ,unit:"pc" )
foodL = companyC.foods.create!(id: 12, name: "イチゴ",total: 30,unit:"粒" )

# 会社に紐付けなくて平気？？？


recipeA = brand1.recipes.create!(id: 1, name: "カルボ")
recipeB = brand1.recipes.create!(id: 2, name: "ミート")
recipeC = brand2.recipes.create!(id: 3, name: "ハンバーグプレート")
recipeD = brand2.recipes.create!(id: 4, name: "御膳A")
recipeE = brand3.recipes.create!(id: 5, name: "親子丼")
recipeF = brand3.recipes.create!(id: 6, name: "御膳A")
recipeG = brand4.recipes.create!(id: 7, name: "チキンカレー")
recipeH = brand4.recipes.create!(id: 8, name: "野菜カレー")
recipeI = brand5.recipes.create!(id: 9, name: "カルビ")
recipeJ = brand5.recipes.create!(id: 10, name: "焼肉定食")
recipeK = brand6.recipes.create!(id: 11, name: "ハンバーグプレート")
recipeL = brand6.recipes.create!(id: 12, name: "おろしバーグ")
recipeM = brand7.recipes.create!(id: 13, name: "腰塚・黒毛和牛 ランプステーキ")
recipeM = brand7.recipes.create!(id: 14, name: "腰塚・黒毛和牛 上肩ロースすき焼き")



food_recipeA = recipeA.food_recipes.create!(id: 1,  food_id: 1, amount: 20 )
food_recipeB = recipeA.food_recipes.create!(id: 2,  food_id: 2, amount: 20 )
food_recipeC = recipeA.food_recipes.create!(id: 3,  food_id: 3, amount: 20 )
food_recipeD = recipeB.food_recipes.create!(id: 4,  food_id: 3, amount: 10 )
food_recipeE = recipeB.food_recipes.create!(id: 5,  food_id: 4, amount: 50 )
food_recipeF = recipeB.food_recipes.create!(id: 6,  food_id: 5, amount: 10 )
food_recipeG = recipeB.food_recipes.create!(id: 7,  food_id: 5, amount: 5 )
food_recipeH = recipeC.food_recipes.create!(id: 8,  food_id: 6, amount: 30 )
food_recipeI = recipeC.food_recipes.create!(id: 9,  food_id: 7, amount: 1 )
food_recipeJ = recipeC.food_recipes.create!(id: 10, food_id: 7, amount: 2 )
food_recipeK = recipeD.food_recipes.create!(id: 11, food_id: 8, amount: 2 )
food_recipeL = recipeD.food_recipes.create!(id: 12, food_id: 9, amount: 20 )
food_recipeM = recipeD.food_recipes.create!(id: 13, food_id: 9, amount: 10 )
food_recipeN = recipeE.food_recipes.create!(id: 14, food_id: 10, amount: 100 )
food_recipeO = recipeE.food_recipes.create!(id: 15, food_id: 11, amount: 30 )


reportA = shopA.reports.create!(id: 1 ,date: '2020-09-01',sale: 100,user_id: 1, shop_id:1)
reportB = shopA.reports.create!(id: 2 ,date: '2020-09-02',sale: 100,user_id: 2, shop_id:1)
reportC = shopB.reports.create!(id: 3 ,date: '2020-09-01',sale: 101,user_id: 2, shop_id:2)
reportD = shopB.reports.create!(id: 4 ,date: '2020-09-02',sale: 102,user_id: 3, shop_id:2)

reportE = shopE.reports.create!(id: 5 ,date: '2020-09-01',sale: 103,user_id: 5, shop_id:5)
reportF = shopE.reports.create!(id: 6 ,date: '2020-09-02',sale: 104,user_id: 6, shop_id:5)
reportG = shopF.reports.create!(id: 7 ,date: '2020-09-01',sale: 105,user_id: 7, shop_id:6)
reportH = shopF.reports.create!(id: 8 ,date: '2020-09-02',sale: 106,user_id: 8, shop_id:6)

reportI = shopI.reports.create!(id: 9 ,date: '2020-09-01',sale: 107,user_id: 9, shop_id:9)
reportJ = shopI.reports.create!(id: 10,date: '2020-09-02',sale: 108,user_id: 10, shop_id:9)
reportK = shopJ.reports.create!(id: 11,date: '2020-09-01',sale: 109,user_id: 11, shop_id:10)
reportL = shopJ.reports.create!(id: 12,date: '2020-09-02',sale: 110,user_id: 12, shop_id:10)

orderA = recipeA.orders.create!(id:  1,count: 10, report_id: 1)
orderB = recipeB.orders.create!(id:  2,count: 12, report_id: 2)
orderC = recipeC.orders.create!(id:  3,count: 9, report_id:  3)
orderD = recipeD.orders.create!(id:  4,count: 8, report_id:  4)
orderE = recipeE.orders.create!(id:  5,count: 13, report_id: 5)
orderF = recipeF.orders.create!(id:  6,count: 6, report_id:  6)
orderG = recipeG.orders.create!(id:  7,count: 4, report_id:  7)
orderH = recipeH.orders.create!(id:  8,count: 7, report_id:  8)
orderI = recipeI.orders.create!(id:  9,count: 3, report_id:  9)
orderJ = recipeJ.orders.create!(id: 10,count: 1, report_id: 10)
orderK = recipeK.orders.create!(id: 11,count: 8, report_id: 11)
orderL = recipeL.orders.create!(id: 12,count: 5, report_id: 12)