program flightplan;
	inputs
		wind_speed, wind_angle: (x,y) using euclidean(x,y);
		air_speed, air_angle: (x,y,t) using euclidean(x,y), closest(t);
		ground_speed, ground_angle: (x,y,t) using euclidean(x,y), closest(t);
	outputs
		crab_angle: arcsin( a * b ) at every 1 sec;
    errors
		e: ground_speed - sqrt( air_speed + 2 * air_speed * wind_speed * cos( wind_angle - air_angle ) * wind_speed ) at every 1 sec;
end;