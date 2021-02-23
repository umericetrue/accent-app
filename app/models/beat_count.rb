class BeatCount < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '2拍目' },
    { id: 3, name: '3拍目' },
    { id: 4, name: '4拍目' },
    { id: 5, name: '5拍目' },
    { id: 6, name: '6拍目' },
    { id: 7, name: '7拍目' },
    { id: 8, name: '8拍目' },
    { id: 9, name: '9拍目' },
    { id: 10, name: '10拍目' },
    { id: 11, name: '11拍目' },
    { id: 12, name: '12拍目' },
    { id: 13, name: '13拍目' },
    { id: 14, name: '14拍目' },
    { id: 15, name: '15拍目' },
    { id: 16, name: '16拍目' },
    { id: 17, name: '17拍目' },
    { id: 18, name: '18拍目' },
    { id: 19, name: '19拍目' }
  ]

  include ActiveHash::Associations
  has_many :accents
end
