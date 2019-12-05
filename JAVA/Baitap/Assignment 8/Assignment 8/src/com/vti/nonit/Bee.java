package com.vti.nonit;

public abstract class Bee {

	private float health;
	private boolean healthStatus;

	Bee() {
		health = 100;
		healthStatus = true;
	}

	public float getHealth() {
		return health;
	}

	public void setHealthStatus(boolean healthStatus) {
		this.healthStatus = healthStatus;
	}

	public boolean checkHealthStatus() {
		return healthStatus;
	}

	public void damage(int damage) {
		if (damage > 0 && damage < 100 && healthStatus) {
			health -= damage;
			if(health < 0){
				health = 0;
			}
		}
	}

}
