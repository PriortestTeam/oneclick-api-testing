package feature;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class CountryParallelTest {
    @Test
    void testParallel() {
        Results results = Runner.path("classpath:feature").tags("~@ignore").parallel(2);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }
}
