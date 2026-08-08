function ui_botao_slide(_sprite, _frame, _x_final, _y, _acao)
{
	return {
		sprite: _sprite,
		frame: _frame,

		x: display_get_gui_width() + sprite_get_width(_sprite),
		y: _y,

		x_final: _x_final,

		hover: false,
		escala: 1,

		ativo: true,
		saindo: false,

		acao: _acao,

		update: function()
		{
			if(!self.saindo)
			{
				self.x = approach(self.x,self.x_final,15);
			}
			else
			{
				self.x = approach(self.x,display_get_gui_width()+sprite_get_width(self.sprite),15);

				if(self.x >= display_get_gui_width()+sprite_get_width(self.sprite))
				{
					self.acao();
				}
			}


			var _mx = device_mouse_x_to_gui(0);
			var _my = device_mouse_y_to_gui(0);

			var _larg = sprite_get_width(self.sprite);
			var _alt = sprite_get_height(self.sprite);

			self.hover = point_in_rectangle(_mx,_my,self.x-_larg*0.5,self.y-_alt*0.5,self.x+_larg*0.5,self.y+_alt*0.5);


			var _alvo = self.hover ? 1.15 : 1;

			self.escala = lerp(self.escala,_alvo,0.2);


			if(self.hover && mouse_check_button_pressed(mb_left) && !self.saindo)
			{
				self.saindo = true;
			}
		},


		draw: function()
		{
			draw_sprite_ext(self.sprite,self.frame,self.x,self.y,self.escala,self.escala,0,c_white,1);
		}
	}
}