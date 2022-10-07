# Kraft

Historically Kafka used ZooKeeper as a metadata server for a cluster. Kraft is a new metadata server for Kafka replacing ZooKeeper. Kraft is embedded in Kafka broker eliminating the need to run a dedicated ZooKeeper cluster together with a Kafka cluster.

## Kraft adoption timeline

While currently Kafka works with both Kraft and ZooKeeper, the support for latter will be removed in the future. We recommend to provision new clusters using Kraft mode.

Detailed timeline for Kraft adoption in Kafka:

- Kraft has been promoted to GA in Kafka 3.3.
- ZooKeeper support in Kafka will be deprecated in Kafka 3.5 (to be released around 2023/04).
- ZooKeeper support will be dropped in Kafka 4.0 (to be released around 2023/08) .


## Client compatibility considerations

Kafka clients do not rely directly on a ZooKeeper connection - brokers use ZooKeeper internally. It is safe to upgrade clusters to use Kraft instead of ZooKeeper and no additional refactoring on the client side will be required. Keep in mind however that some administrative tooling may rely on a direct connection with ZooKeeper.