# Application Signature

To build a release version of the application, it is necessary to sign the apk file.

To do this, follow these steps:

- Create a keystore.
- Set up the required Gradle tasks.
- Upload the keystore to your continuous integration/continuous delivery and deployment (CI/CD) automation software tool.
- Configure CI/CD in the project.

## Creating a Keystore

The application signature will be a file in the *.jks format.
The filename should follow the pattern: *project_name_release.jks*

To create the signature, you can refer to the [official documentation](https://developer.android.com/studio/publish/app-signing).

You should also create a file named `keystore_release.properties` and place the following data in it:
```
storePassword=*myStorePassword*
keyPassword=*mykeyPassword*
keyAlias=*myKeyAlias*
storeFile=../keystore/*project_name*_release.jks
```

> [!WARNING]
> **Important:**
> - Do not change the filename `keystore_release.properties`!
> - These files need to be placed in the `android/keystore` directory.
> - **Storing them in the repository is prohibited.**

To allow team members to locally build the release version, you should also share these files with them.

## Configuring the Project to Work with Keystore

Next, you need to create a file named [`keystoreConfig.gradle`](../android/keystore/keystoreConfig.gradle) in the `keystore` folder.
You can copy it to your project.

Copy [`signinConfigs.gradle`](../android/keystore/signingConfigs.gradle) to your project.
Make sure it contains the following:
```
release {
            apply from: '../keystore/keystoreConfig.gradle'

            keyAlias keystoreConfig.keyAlias
            keyPassword keystoreConfig.keyPassword
            storeFile file(keystoreConfig.storeFile)
            storePassword keystoreConfig.storePassword
        }
```

## Uploading to Jenkins / Configuring CI in the Project

The two files obtained in the previous step, `*.jks` and `*.properties`, should be uploaded to Jenkins to support building the release version of the application through Continuous Integration (CI).

To upload the files to the system, contact the administrator.

## Local Build of the Release Version

To build the release version of the application locally, you need to place the signed file in the `keystore` folder.



