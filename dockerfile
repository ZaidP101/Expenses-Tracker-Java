# Stage - 1 Build JAR 

FROM maven:3.8.3-openjdk-17 AS builder

WORKDIR /app

COPY . . 

RUN mvn clean install -DskipTests=true

# Stage - 2 Execute JAR
FROM openjdk:17-alpine

WORKDIR /app

COPY --from=builder /app/target/ExpensesTracker-0.0.1-SNAPSHOT.jar /app/expenseapp.jar

CMD ["java", "-jar", "expenseapp.jar"]
