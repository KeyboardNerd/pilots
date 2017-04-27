program AirFranceBayes;
	inputs
		true_air_speed, ground_speed, wind_speed, wind_speed_estimate (t) using closest(t);
		air_angle, ground_angle, wind_angle, wind_angle_estimate (t) using closest(t);
		emode (t) using predict(bayes_airfrance, true_air_speed, ground_speed, wind_speed, wind_angle, air_angle);
	outputs
		true_air_speed_out: true_air_speed at every 1 sec;
    errors
		e: emode;
    signatures
        s0(K): e = K, -0.1 < K, K < 0.1           "No error";
        s1(K): e = K, 0.9 < K, K < 1.1       "Pitot tube failure"
		estimate true_air_speed = sqrt(ground_speed*ground_speed + wind_speed_estimate*wind_speed_estimate -
			  	2*ground_speed*wind_speed_estimate*cos((PI/180)*(ground_angle-wind_angle_estimate)));
        s2(K): e = K, 1.99999 < K, K < 2.000001        "GPS failure"
		estimate ground_speed = sqrt(true_air_speed*true_air_speed + wind_speed_estimate*wind_speed_estimate +
                2*true_air_speed*wind_speed_estimate*cos((PI/180)*(wind_angle_estimate-air_angle)));
	s3(K): e = K, 2.99999 < K, K < 3.00001	"new Modes";
end
