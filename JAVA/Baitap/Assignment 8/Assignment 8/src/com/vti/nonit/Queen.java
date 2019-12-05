package com.vti.nonit;

public class Queen extends Bee{
	@Override
	public void damage(int damage) {
		super.damage(damage);
		if(getHealth() < 20){
			setHealthStatus(false);
		}
	}
}
