// create a new game instance
// webGL or Canvas or AUTO
var game = new Phaser.Game(640, 360, Phaser.AUTO);

// states -- GameState is unique
var GameState = {
	// before game
	preload: function() {
		// loading assets (key, path)
		this.load.image('farm', 'assets/images/farm.jpg');
	},
	// on create game
	create: function() {
		/**
			Scale Manager
		 */
		this.scale.scaleMode = Phaser.ScaleManager.SHOW_ALL;
		this.scale.pageAlignVertically = true;
		this.scale.pageAlignHorizontally = true;

		//this.scale.setScreenSize(true);

		// adding background
		// this.game will give access to the games object
		// add sprite will be top left corner (x, y, keyname);
		this.background = this.game.add.sprite(0, 0, 'farm');
	},
	// during update
	update: function() {

	},
};

game.state.add('GameState', GameState);
game.state.start('GameState');