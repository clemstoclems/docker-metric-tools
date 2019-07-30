include Makelaunch

install:
	make install create_db env=$(env)
	make install create_dashboard env=$(env)
