class PartOfSpeech < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '名詞' },
    { id: 3, name: '動詞' },
    { id: 4, name: '形容詞' },
    { id: 5, name: '形容動詞' },
    { id: 6, name: '副詞' },
    { id: 7, name: '連体詞' },
    { id: 8, name: '接続詞' },
    { id: 9, name: '感動詞' },
    { id: 10, name: '数詞' },
    { id: 11, name: 'その他（上記＋付属語など）' }
  ]

  include ActiveHash::Associations
  has_many :accents
end
