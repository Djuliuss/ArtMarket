#!/bin/bash
docker exec cli.Asus bash -c "peer chaincode invoke -C asus -n pcxchg -c '{\"Args\":[\"createPC\", \"Asus001\", \"foo\", \"bar\"]}'"
docker exec cli.Asus bash -c "peer chaincode invoke -C asus -n pcxchg -c '{\"Args\":[\"createPC\", \"Asus002\", \"foo\", \"bar\"]}'"
docker exec cli.Asus bash -c "peer chaincode invoke -C asus -n pcxchg -c '{\"Args\":[\"createPC\", \"Asus003\", \"foo\", \"bar\"]}'"

docker exec cli.HP bash -c "peer chaincode invoke -C hp -n pcxchg -c '{\"Args\":[\"createPC\", \"HP001\", \"foo\", \"bar\"]}'"
docker exec cli.HP bash -c "peer chaincode invoke -C hp -n pcxchg -c '{\"Args\":[\"createPC\", \"HP002\", \"foo\", \"bar\"]}'"

docker exec cli.Dell bash -c "peer chaincode invoke -C dell -n pcxchg -c '{\"Args\":[\"createPC\", \"Dell001\", \"foo\", \"bar\"]}'"
docker exec cli.Dell bash -c "peer chaincode invoke -C dell -n pcxchg -c '{\"Args\":[\"createPC\", \"Dell002\", \"foo\", \"bar\"]}'"
docker exec cli.Dell bash -c "peer chaincode invoke -C dell -n pcxchg -c '{\"Args\":[\"createPC\", \"Dell003\", \"foo\", \"bar\"]}'"
docker exec cli.Dell bash -c "peer chaincode invoke -C dell -n pcxchg -c '{\"Args\":[\"createPC\", \"Dell004\", \"foo\", \"bar\"]}'"

docker exec cli.Amazon bash -c "peer chaincode query -C asus -n pcxchg -c '{\"Args\":[\"queryStock\"]}'"
docker exec cli.Amazon bash -c "peer chaincode query -C hp -n pcxchg -c '{\"Args\":[\"queryStock\"]}'"
docker exec cli.Amazon bash -c "peer chaincode query -C dell -n pcxchg -c '{\"Args\":[\"queryStock\"]}'"

docker exec cli.Amazon bash -c "peer chaincode invoke -C dell -n pcxchg -c '{\"Args\":[\"buyPC\", \"Dell004\"]}'"

docker exec cli.Amazon bash -c "peer chaincode query -C asus -n pcxchg -c '{\"Args\":[\"queryDetail\", \"Asus003\"]}'"

docker exec cli.Amazon bash -c "peer chaincode invoke -C asus -n pcxchg -c '{\"Args\":[\"buyPC\", \"Asus003\"]}'"

docker exec cli.Amazon bash -c "peer chaincode invoke -C asus -n pcxchg -c '{\"Args\":[\"handBackPC\", \"Asus003\"]}'"

docker exec cli.Amazon bash -c "peer chaincode invoke -C dell -n pcxchg -c '{\"Args\":[\"buyPC\", \"Dell004\"]}'"


