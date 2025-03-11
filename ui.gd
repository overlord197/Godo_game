extends Control

var player_coins = 0

func _ready():
	update_coin_label()

func add_coins(amount):
	player_coins += amount
	update_coin_label()

func update_coin_label():
	$Label.text = "Coins: " + str(player_coins)
