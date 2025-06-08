Connection data
 
	PostgreSQL Database
		-Port: 5432
		-Database Name: dasi_application_db
		-Username: dasi_user
		-Password: pass
			*Example Connection: jdbc:postgresql://127.0.0.1:5432/dasi_application_db?user=dasi_user&password=pass

	RabbitMQ
		-AMQP Port: 5672
		-UI Port: 15672
		-Username: dasi_rabbitmq_user
		-Password: pass
			*Example AMQP Connection: amqp://dasi_rabbitmq_user:pass@127.0.0.1:5672/
			*RabbitMQ Management UI: http://localhost:15672 (Login with dasi_rabbitmq_user and pass)

