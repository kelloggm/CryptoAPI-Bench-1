### Continuous Compliance, section 7 reproduction package

This is a modified version of the CryptoAPIBench project that was used to run
the experiments in Section 7 of the ASE 2020 paper "Continuous Compliance" by
Kellogg et al. This reproduction package is not intended to be used "out of the
box", because there was no artifact evaluation process at ASE this year.
Instead, this is a record of the exact scripts and data that I used. I
endeavored to include everything needed, but if you are trying to reproduce
these experiments you should expect to modify some scripts (e.g. to correct
absolute paths). Please contact me (Martin Kellogg, kelloggm@cs.washington.edu)
if you encounter any problems - I'd be happy to help.

The expected results for the standard (CryptoAPIBench) configuration
are contained in the file CryptoAPI-Bench_details.xlsx.
Our analysis of the results of each run, and the computations for the
precision and recall, are in the files <toolname>-results.xlsx. There is
no such file for SpotBugs(D), because it produced no findings related
to security at all, making the computations trivial.

Before running any tool, run `./gradlew clean build` in this directory
to produce the .class files that most of these tools require.

There are six tools that are included in the comparison:
* SpotBugs(D), the desktop version of SpotBugs. Run the script `run-spotbugs.sh`
to produce the SpotBugs(D) output. Disregard any output that is not in the
SECURITY category (this should be all of the output).
* SpotBugs(S), the SWAMP version of SpotBugs. Because SpotBugs(S) is a service,
this reproduction cannot include it. The output from the service was
downloadable, so it is included as `swamp-out`.
* Coverity. Because Coverity is a service, this reproduction package cannot
include it. The output of Coverity was not downloadable, so there is no
way to include even that here.
* CrySL. Run the `run-crysl.sh` script and examine the output.
* CryptoGuard. Ensure the environment variables defined at the beginning
of the `run-cryptoguard.sh` script are accurate. Run `run-crpytoguard.sh`.
* Our checkers. Ensure that the Checker Framework, the No Literal Checker,
and the Crypto Policy Compliance Checker are built on your system. Ensure
that the classpaths in `run-dljc-crypto.sh` and `run-dljc-noliteral.sh`
are accurate. Run the `run-dljc.sh` script and examine the output in the
`crypto-dljc-out/wpi.log` and `noliteral-dljc-out/wpi.log` files.

The following is the original README for CryptoAPIBench:

# CryptoAPI-Bench

Comprehensive benchmark on Java Cryptographic misuses. It contains 16 cryptographic vulnerabilities. It contains both secure and insecure code snippet. Please check the CryptoAPI_Bench_details.xlsx for more information.

### Build Cryptoapi-bench
1. Run `cd /path/to/cryptoapi-bench`
2. Run `gradle clean build`

A Jar will be created in `cd /path/to/cryptoapi-bench/build/libs/` folder. Use different Cryptographic vulnerability detection tools to analyze the Jar.  

The `CryptoAPI-Bench_details.xlsx` contains the summary of secure and nonsecure code and pointed out the vulnerability.


### Paper
If you use this code or these benchmarks in your research, please cite the following publications.
```
@inproceedings{afrose2019cryptoapi,
  title={CryptoAPI-Bench: A Comprehensive Benchmark on Java Cryptographic API Misuses},
  author={Afrose, Sharmin and Rahaman, Sazzadur and Yao, Danfeng},
  booktitle={2019 IEEE Cybersecurity Development (SecDev)},
  pages={49--61},
  year={2019},
  organization={IEEE}
}

@inproceedings{rahaman2019cryptoguard,
  title={Cryptoguard: High precision detection of cryptographic vulnerabilities in massive-sized java projects},
  author={Rahaman, Sazzadur and Xiao, Ya and Afrose, Sharmin and Shaon, Fahad and Tian, Ke and Frantz, Miles and Kantarcioglu, Murat and Yao, Danfeng},
  booktitle={Proceedings of the 2019 ACM SIGSAC Conference on Computer and Communications Security},
  pages={2455--2472},
  year={2019}
}
```

### Contact
If you have any questions or suggestions regarding this project, please email to sharminafrose@vt.edu
