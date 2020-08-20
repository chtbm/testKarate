import com.intuit.karate.KarateOptions;

@KarateOptions(features = "src/test/resources/features", tags = {"@test2"})
public class Runner extends RunParallel{
}
