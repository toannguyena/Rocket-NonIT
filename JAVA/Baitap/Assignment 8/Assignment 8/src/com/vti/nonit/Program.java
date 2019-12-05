package com.vti.nonit;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.Scanner;

public class Program {
	public static void main(String[] args) {
		List<Bee> bees = new ArrayList<>();
		Scanner scan = new Scanner(System.in);

		while (true) {
			System.out.println("Moi ban nhap 1 hoac 2");
			switch (scan.nextInt()) {
			case 1:
				createListBee(bees);
				break;
			case 2:
				damageBee(bees);
				break;
			default:
				System.out.println("Moi ban nhap lai :");
				return;
			}
		}

	}

	private static void createListBee(List<Bee> bees) {
		Random random = new Random();
		bees.clear();
		for (int i = 0; i < 10; i++) {
			switch (random.nextInt(3)) {
			case 0:
				Queen queen = new Queen();
				bees.add(queen);
				break;
			case 1:
				Worker worker = new Worker();
				bees.add(worker);
				break;
			case 2:
				Drone drone = new Drone();
				bees.add(drone);
				break;
			default:
				break;
			}
		}
		for (int i = 0; i < bees.size(); i++) {
			System.out.println(bees.get(i).toString() + " " + bees.get(i).getHealth());
		}

	}

	private static void damageBee(List<Bee> bees) {
		Random random = new Random();
		for (int i = 0; i < bees.size(); i++) {
			int randomDamage = random.nextInt(81);
			bees.get(i).damage(randomDamage);
		}

		for (int i = 0; i < bees.size(); i++) {
			System.out.println(
					bees.get(i).toString() + " " + bees.get(i).getHealth() + " " + bees.get(i).checkHealthStatus());
		}

	}

}
