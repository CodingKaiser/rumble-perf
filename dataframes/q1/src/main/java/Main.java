import org.apache.spark.sql.SparkSession;
import org.apache.spark.sql.Dataset;
import org.apache.spark.sql.Row;

public class Main {
    public static void main(String[] args) {

        long start = System.nanoTime();
        SparkSession spark = SparkSession
                .builder()
                .appName("DataFrames Query 1")
                .getOrCreate();

        Dataset<Row> confusion = spark.read().json("../../confusion-2014-03-02/confusion-2014-03-02.json");

        confusion.createOrReplaceTempView("confusion");

        Dataset<Row> result = spark.sql("SELECT * FROM confusion WHERE target = guess");
        
        result.write().json("output1");
        
        long end = System.nanoTime();
        System.out.println(((end - start) / 1000000) + "milliseconds");

    }
}
