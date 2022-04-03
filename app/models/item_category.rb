class ItemCategory < ActiveHash::Base
  self.data = [
    { id: 1, item_category: '--' },
    { id: 2, item_category: 'メンズ' },
    { id: 3, item_category: 'レディース' },
    { id: 4, item_category: 'ベビー・キッズ' },
    { id: 5, item_category: 'インテリア・住まい・小物' },
    { id: 6, item_category: '本・音楽・ゲーム' },
    { id: 7, item_category: 'おもちゃ・ホビー・グッズ' },
    { id: 8, item_category: '家電・スマホ・カメラ' },
    { id: 9, item_category: 'スポーツ・レジャー' },
    { id: 10, item_category: 'ハンドメイド' }
    { id: 11, item_category: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :items
  end