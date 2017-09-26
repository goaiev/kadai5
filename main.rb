# coding: utf-8
require 'dxruby'

require_relative 'player'
require_relative 'enemy'

Window.width  = 800
Window.height = 600


back1 = Image.load('image/back1.jpg') #背景
pshot = Image.load('image/pshot.png') #プレイヤーの弾
eshot = Image.load('image/eshot.png') #敵の弾


player_img = Image.load("image/player.png")
player_img.setColorKey([255, 255, 255])

enemy_img = Image.load("image/enemy1.png")
#enemy_img.setColorKey([0, 0, 0])

player = Player.new(400, 500, player_img)

enemies = []
10.times do
  enemies << Enemy.new(rand(800), rand(600), enemy_img)
end

Window.loop do
  break if Input.keyPush?(K_ESCAPE)
  Window.draw(0, 0, back1)

  Sprite.update(enemies)
  Sprite.draw(enemies)

  player.update
  player.draw

  # 当たり判定
  Sprite.check(player, enemies)
end