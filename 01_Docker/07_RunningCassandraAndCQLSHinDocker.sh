docker run -d -name cass1 poklet/cassandra
# Run cqlsh 
docker run -it --rm --link cass1:cass1 poklet/cassandra bash -c 'cqlsh $CASS1_PORT_9160_TCP_ADDR'
