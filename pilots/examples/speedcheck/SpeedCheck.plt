program SpeedCheck;
	inputs
		wind_speed, wind_angle (x,y,z) using euclidean(x,y), interpolate(z,2);
		air_speed, air_angle (x,y,t) using euclidean(x,y), closest(t);
		ground_speed, ground_angle (x,y,t) using euclidean(x,y), closest(t);
	outputs
		o: ground_speed - sqrt( air_speed * air_speed + 
		   				  		2 * air_speed * wind_speed * cos((2 * PI/360) * (wind_angle - air_angle)) +
								wind_speed * wind_speed ) at every 1 min;
    errors
		e: ground_speed - sqrt( air_speed * air_speed + 
		   				  		2 * air_speed * wind_speed * cos((2 * PI/360) * (wind_angle - air_angle)) +
								wind_speed * wind_speed );
    signatures
		s0: e = 0                       "Normal";
		s1(K): e = K, K < 100           "Pitot tube failure";
		s2: e = -150                    "GPS failure";
		s3(K): e = K, -150 < K, K < 0   "Pitot tube + GPS failure";
	correct;    
end;