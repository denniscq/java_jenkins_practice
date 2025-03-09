# 使用 OpenJDK 运行环境
FROM openjdk:17
WORKDIR /app

# 复制源代码并编译
COPY Main.java .
RUN javac Main.java

# 运行 Java 应用
CMD ["java", "Main"]
