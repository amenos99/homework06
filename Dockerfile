FROM java:8
ADD HelloWorld.java .
RUN javac HelloWorld.java
CMD ["java", "HelloWorld"]
