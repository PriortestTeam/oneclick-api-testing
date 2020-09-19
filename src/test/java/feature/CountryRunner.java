package feature;

import com.intuit.karate.junit5.Karate;

public class CountryRunner {
/*
    @Karate.Test
    Karate testTags() { return Karate.run("country-get").tags("@Value").relativeTo(getClass()); }

    @Karate.Test
    Karate testSingle() {
        return Karate.run("country-get").relativeTo(getClass());
    }

    @Karate.Test
    Karate testFullPath() {
        return Karate.run("classpath:feature/country-get.feature").tags("@Contents");
    }

    @Karate.Test
    Karate testPost() { return Karate.run("country-post").relativeTo(getClass());} // will not run, country-post.feature is not in current folder

    @Karate.Test
    Karate testinFeaturePost() { return Karate.run("classpath:featurepost/country-post.feature").relativeTo(getClass());}

    @Karate.Test
    Karate testAll() {
        return Karate.run().relativeTo(getClass());
    }
    */
/*
    @Karate.Test
    Karate testVar() { return Karate.run("testvar-use").tags("@Var").relativeTo(getClass()); }*/

  /*  @Karate.Test
    Karate testReuse() { return Karate.run("testreuse-multiread").tags("@Reuse").relativeTo(getClass()); }*/

    @Karate.Test
    Karate testCustomClass() { return Karate.run("test-custom-class").tags("@customClass").relativeTo(getClass()); }
}
