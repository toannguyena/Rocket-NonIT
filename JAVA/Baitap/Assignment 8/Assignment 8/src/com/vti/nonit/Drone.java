package com.vti.nonit;

public class Drone extends Bee {
	@Override
	public void damage(int damage) {
		super.damage(damage);
		if(getHealth() < 50){
			setHealthStatus(false);
		}
	}
}
