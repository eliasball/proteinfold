@@ -1,36 +0,0 @@
/*
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    Nextflow config file for running minimal tests
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    Defines input files and everything required to run a fast and simple pipeline test.
    Use as follows:
        nextflow run nf-core/proteinfold -profile test,<docker/singularity> --outdir <OUTDIR>
----------------------------------------------------------------------------------------
*/

stubRun = true

params {
    config_profile_name        = 'Test profile'
    config_profile_description = 'Minimal test dataset to check pipeline function'

    // Limit resources so that this can run on GitHub Actions
    max_cpus   = 2
    max_memory = '6.GB'
    max_time   = '6.h'

    // Input data to test colabfold with a local server analysis
    mode             = 'colabfold'
    colabfold_server = 'webserver'
    colabfold_db     = "${projectDir}/assets/dummy_db_dir"
    input            = 'https://raw.githubusercontent.com/nf-core/test-datasets/proteinfold/testdata/samplesheet/v1.0/samplesheet.csv'
}

process {
    withName: 'COLABFOLD_BATCH' {
        container = 'quay.io/biocontainers/gawk:5.1.0'
    }
}
