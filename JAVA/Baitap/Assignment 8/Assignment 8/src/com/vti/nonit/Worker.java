package com.vti.nonit;

public class Worker extends Bee {
	
	@Override
	public void damage(int damage) {
		super.damage(damage);
		if(getHealth() < 70){
			setHealthStatus(false);
		}
	}
}
