////////////////////////////////////////////////////////////////////////////////////////////////////
//
//  Written by Oscar ter Hofstede
//  Created on 24 May 2014
//
////////////////////////////////////////////////////////////////////////////////////////////////////
//
//  Note: although the sphero API uses many 8, 16 and 32-bit values, internally we work with
//  standard int values, to avoid coercion problems in Processing
//
////////////////////////////////////////////////////////////////////////////////////////////////////

// Device IDs
final byte DID_CORE                       = 0x00;
final byte DID_BOOTLOADER                 = 0x01;
final byte DID_SPHERO                     = 0x02;

// Core Commands, DID = 0x00
final byte CMD_PING                       = 0x01;
final byte CMD_VERSION                    = 0x02;
final byte CMD_CONTROL_UART_TX            = 0x03;
final byte CMD_SET_BT_NAME                = 0x10;
final byte CMD_GET_BT_NAME                = 0x11;
final byte CMD_SET_AUTO_RECONNECT         = 0x12;
final byte CMD_GET_AUTO_RECONNECT         = 0x13;
final byte CMD_GET_PWR_STATE              = 0x20;
final byte CMD_SET_PWR_NOTIFY             = 0x21;
final byte CMD_SLEEP                      = 0x22;
final byte GET_POWER_TRIPS                = 0x23;
final byte SET_POWER_TRIPS                = 0x24;
final byte SET_INACTIVE_TIMER             = 0x25;
final byte CMD_GOTO_BL                    = 0x30;
final byte CMD_RUN_L1_DIAGS               = 0x40;
final byte CMD_RUN_L2_DIAGS               = 0x41;
final byte CMD_CLEAR_COUNTERS             = 0x42;
final byte CMD_ASSIGN_TIME                = 0x50;
final byte CMD_POLL_TIMES                 = 0x51;

// Bootloader Commands, DID = 0x01
final byte BEGIN_REFLASH                  = 0x02;
final byte HERE_IS_PAGE                   = 0x03;
final byte LEAVE_BOOTLOADER               = 0x04;
final byte IS_PAGE_BLANK                  = 0x05;
final byte CMD_ERASE_USER_CONFIG          = 0x06;

// Sphero Commands, DID = 0x02
final byte CMD_SET_CAL                    = 0x01;
final byte CMD_SET_STABILIZATION          = 0x02;
final byte CMD_SET_ROTATION_RATE          = 0x03;
final byte CMD_SET_CREATION_DATE          = 0x04;
final byte CMD_GET_BALL_REG_WEBSITE       = 0x05;      // deprecated
final byte CMD_REENABLE_DEMO              = 0x06;
final byte CMD_GET_CHASSIS_ID             = 0x07;
final byte CMD_SET_CHASSIS_ID             = 0x08;
final byte CMD_SELF_LEVEL                 = 0x09;
final byte CMD_SET_VDL                    = 0x0A;
final byte CMD_SET_DATA_STREAMING         = 0x11;
final byte CMD_SET_COLLISION_DETECTION    = 0x12;
final byte CMD_LOCATOR                    = 0x13;
final byte CMD_SET_ACCELERO               = 0x14;
final byte CMD_READ_LOCATOR               = 0x15;
final byte CMD_SET_RGB_LED                = 0x20;
final byte CMD_SET_BACK_LED               = 0x21;
final byte CMD_GET_RGB_LED                = 0x22;
final byte CMD_ROLL                       = 0x30;
final byte CMD_BOOST                      = 0x31;
final byte CMD_MOVE                       = 0x32;
final byte CMD_SET_RAW_MOTORS             = 0x33;
final byte CMD_SET_MOTION_TO              = 0x34;
final byte CMD_SET_OPTIONS_FLAG           = 0x35;
final byte CMD_GET_OPTIONS_FLAG           = 0x36;
final byte CMD_SET_TEMP_OPTIONS_FLAG      = 0x37;
final byte CMD_GET_TEMP_OPTIONS_FLAG      = 0x38;
final byte CMD_GET_CONFIG_BLK             = 0x40;
final byte CMD_SET_SSB_PARAMS             = 0x41;
final byte CMD_SET_DEVICE_MODE            = 0x42;
final byte CMD_SET_CFG_BLOCK              = 0x43;
final byte CMD_GET_DEVICE_MODE            = 0x44;
final byte CMD_GET_SSB                    = 0x46;
final byte CMD_SET_SSB                    = 0x47;
final byte CMD_SSB_REFILL                 = 0x48;
final byte CMD_SSB_BUY                    = 0x49;
final byte CMD_SSB_USE_CONSUMEABLE        = 0x4A;
final byte CMD_SSB_GRANT_CORES            = 0x4B;
final byte CMD_SSB_ADD_XP                 = 0x4C;
final byte CMD_SSB_LEVEL_UP_ATTR          = 0x4D;
final byte CMD_GET_PW_SEED                = 0x4E;
final byte CMD_SSB_ENABLE_ASYNC           = 0x4F;
final byte CMD_RUN_MACRO                  = 0x50;
final byte CMD_SAVE_TEMP_MACRO            = 0x51;
final byte CMD_SAVE_MACRO                 = 0x52;
final byte CMD_INIT_MACRO_EXECUTIVE       = 0x54;
final byte CMD_ABORT_MACRO                = 0x55;
final byte CMD_MACRO_STATUS               = 0x56;
final byte CMD_SET_MACRO_PARAM            = 0x57;
final byte CMD_APPEND_TEMP_MACRO_CHUNK    = 0x58;
final byte CMD_ERASE_ORBBAS               = 0x60;
final byte CMD_APPEND_FRAG                = 0x61;
final byte CMD_EXEC_ORBBAS                = 0x62;
final byte CMD_ABORT_ORBBAS               = 0x63;
final byte CMD_ANSWER_INPUT               = 0x64;
final byte CMD_COMMIT_TO_FLASH            = 0x65;      // ? double entry?
// final byte CMD_COMMIT_TO_FLASH         = 0x70;      // ? double entry?

// Message Response Codes
final byte ORBOTIX_RSP_CODE_EGEN          = 0x01;      // General, non-specific error
final byte ORBOTIX_RSP_CODE_ECHKSUM       = 0x02;      // Received checksum failure
final byte ORBOTIX_RSP_CODE_EFRAG         = 0x03;      // Received command fragment
final byte ORBOTIX_RSP_CODE_EBAD_CMD      = 0x04;      // Unknown command ID
final byte ORBOTIX_RSP_CODE_EUNSUPP       = 0x05;      // Command currently unsupported
final byte ORBOTIX_RSP_CODE_EBAD_MSG      = 0x06;      // Bad message format
final byte ORBOTIX_RSP_CODE_EPARAM        = 0x07;      // Parameter value(s) invalid
final byte ORBOTIX_RSP_CODE_EEXEC         = 0x08;      // Failed to execute command
final byte ORBOTIX_RSP_CODE_EBAD_DID      = 0x09;      // Unknown Device ID
final byte ORBOTIX_RSP_CODE_POWER_NOGOOD  = 0x31;      // Voltage too low for reflash operation
final byte ORBOTIX_RSP_CODE_PAGE_ILLEGAL  = 0x32;      // Illegal page number provided
final byte ORBOTIX_RSP_CODE_FLASH_FAIL    = 0x33;      // Page did not reprogram correctly
final byte ORBOTIX_RSP_CODE_MA_CORRUPT    = 0x34;      // Main Application corrupt
final byte ORBOTIX_RSP_CODE_MSG_TIMEOUT   = 0x35;      // Msg state machine timed out


////////////////////////////////////////////////////////////////////////////////////////////////////

int SPHERO_IMU_YAW   = 0x00010000;
int SPHERO_IMU_ROLL  = 0x00020000;
int SPHERO_IMU_PITCH = 0x00040000;


////////////////////////////////////////////////////////////////////////////////////////////////////


class SpheroResponsePackage
{
    int      mSOP1;                  // always 0xFF
    int      mSOP2;                  // 0xFF for normal response, 0xFE for async message
    int      mMRSP;                  // message response (sync only)
    int      mSEQ;                   // sequence number (sync only)
    int      mIDCODE;                // type of data (async only)
    int      mDLEN;                  // data length + 1
    byte[]   mData;                  // data
    int      mCHK;                   // checksum 
    
    int getInt8  (int i)  { return mData[i]; }
    int getInt16 (int i)  { return (mData[i]<<8) + mData[i+1]; }
    int getInt32 (int i)  { return (mData[i]<<24) + (mData[i+1]<<16) + (mData[i+2]<<8) + mData[i+3]; }
};


class SpheroVersionInfo
{
    int      mModel;                // 3     Model number; currently 02h for Sphero
    int      mHardware;             // 1     Hardware version code (ranges 1 through 9)
    String   mVersion;              // 3.59  Main Sphero Application version byte
    String   mBootLoaderVersion;    // 3.3   Bootloader version
    String   mOrbBasicVersion;      // 1.7   orbBasic version
    String   mMacroVersion;         // 0.6   Macro executive version
    String   mApiVersion;           // -     API revision code this firmware implements

    void Fetch (SpheroResponsePackage response)
    {
        mModel = response.getInt8(1);
        mHardware = response.getInt8(2);
        mVersion = response.getInt8(3) + "." + response.getInt8(4);
        mBootLoaderVersion = ((response.getInt8(5) >> 4) & 0x0F) + "." + (response.getInt8(5) & 0x0F);
        mOrbBasicVersion = ((response.getInt8(6) >> 4) & 0x0F) + "." + (response.getInt8(6) & 0x0F);
        mMacroVersion = ((response.getInt8(7) >> 4) & 0x0F) + "." + (response.getInt8(7) & 0x0F);
        mApiVersion = (response.mData.length >= 10) ? response.getInt8(8) + "." + response.getInt8(9) : "-";
    }
};


class SpheroLocatorInfo
{
    int      mXPos;                 // x position
    int      mYPos;                 // y position
    int      mXVel;                 // x velocity
    int      mYVel;                 // y velocity
    int      mSOG;                  // speed over ground
    
    void Fetch (SpheroResponsePackage response)
    {
        mXPos = response.getInt16(0);
        mYPos = response.getInt16(2);
        mXVel = response.getInt16(4);
        mYVel = response.getInt16(6);
        mSOG  = response.getInt16(8);
    }
};


class SphereAttributeInfo
{
    int      mID;                   // attribute ID
    int      mLevel;                // new level
    int      mPointsRemaining;      // remaining attribute points
    
    void Fetch (SpheroResponsePackage response)
    {
        mID = response.getInt8(0);
        mLevel = response.getInt8(1);
        mPointsRemaining = response.getInt16(2);
    }
};


class SpheroMacroInfo
{
    int      mID;                   // macro ID
    int      mCommandNr;            // command number
    
    void Fetch (SpheroResponsePackage response)
    {
        mID = response.getInt8(0);
        mCommandNr = response.getInt16(1);
    }
};


class SpheroDiagnosticsInfo
{
    int      mRecVer;               // Record version code – the following definition is for 01h
    int      mRx_Good;              // Good packets received (unsigned 32-bit value)
    int      mRx_Bad_DID;           // Packets with a bad Device ID (unsigned 32-bit value)
    int      mRx_Bad_DLEN;          // Packets with a bad data length (unsigned 32-bit value)
    int      mRx_Bad_CID;           // Packets with a bad Command ID (unsigned 32-bit value)
    int      mRx_Bad_CHK;           // Packets with a bad checksum (unsigned 32-bit value)
    int      mRx_Buff_Ovr;          // Receive buffer overruns (unsigned 32-bit value)
    int      mTx_Msgs;              // Messages transmitted (unsigned 32-bit value)
    int      mTx_Buff_Ovr;          // Transmit buffer overruns (unsigned 32-bit value)
    int      mLastBootReason;       // Reason for last boot (8-bit value)
    int[]    mBootCounters;         // 16 different counts of boot reasons
    int      mChargeCount;          // Charge cycles (unsigned 16-bit value)
    int      mSecondsSinceCharge;   // Awake time in seconds since last charge (unsigned 16-bit value)
    int      mSecondsOn;            // Life awake time in seconds (unsigned 32-bit value)
    int      mDistanceRolled;       // Distance rolled (unsigned 32-bit value)
    int      mSensorFailures;       // Count of I2C bus failures (unsigned 16-bit value)
    int      mGyroAdjustCount;      // Lifetime count of automatic GACs (unsigned 32-bit value)
    
    void Fetch (SpheroResponsePackage response)
    {
        mRecVer = response.getInt8(0x00);
        mRx_Good = response.getInt32(0x03);
        mRx_Bad_DID = response.getInt32(0x07);
        mRx_Bad_DLEN = response.getInt32(0x08);
        mRx_Bad_CID = response.getInt32(0x0F);
        mRx_Bad_CHK = response.getInt32(0x13);
        mRx_Buff_Ovr = response.getInt32(0x1F);
        mTx_Msgs = response.getInt32(0x1B);
        mTx_Buff_Ovr = response.getInt32(0x1F);
        mLastBootReason = response.getInt8(0x23);
        mBootCounters = new int [16];
        for (int i = 0; i < 16; i++)
            mBootCounters[i] = response.getInt8(0x24 + i); // are these 8-bits or 16-bits values?
        mChargeCount = response.getInt16(0x46);
        mSecondsSinceCharge = response.getInt16(0x48);
        mSecondsOn = response.getInt32(0x4A);
        mDistanceRolled = response.getInt32(0x4E);
        mSensorFailures = response.getInt16(0x52);
        mGyroAdjustCount = response.getInt32(0x54);
     }
};


class SpheroStreamingInfo
{
    int      mRawAccelX;           // 0x80000000 - accelerometer axis X, raw; -2048 to 2047; 4mG
    int      mRawAccelY;           // 0x40000000 - accelerometer axis Y, raw, -2048 to 2047, 4mG
    int      mRawAccelZ;           // 0x20000000 - accelerometer axis Z, raw, -2048 to 2047, 4mG
    int      mRawGyroX;            // 0x10000000 - gyro axis X, raw, -32768 to 32767, 0.068 degrees
    int      mRawGyroY;            // 0x08000000 - gyro axis Y, raw, -32768 to 32767, 0.068 degrees
    int      mRawGyroZ;            // 0x04000000 - gyro axis Z, raw, -32768 to 32767, 0.068 degrees
    int      mRawRightMotorBackEMF;// 0x00400000 - right motor back EMF, raw, -32768 to 32767, 22.5 cm
    int      mRawLeftMotorBackEMF; // 0x00200000 - left motor back EMF, raw, -32768 to 32767, 22.5 cm
    int      mRawLeftMotorPWM;     // 0x00100000 - left motor, PWM, raw, -2048 to 2047, duty cycle
    int      mRawRightMotorPWM;    // 0x00080000 - right motor, PWM raw, -2048 to 2047, duty cycle
    int      mIMUPitch;            // 0x00040000 - IMU pitch angle, filtered, -179 to 180, degrees
    int      mIMURoll;             // 0x00020000 - IMU roll angle, filtered, -179 to 180, degrees
    int      mIMUYaw;              // 0x00010000 - IMU yaw angle, filtered, -179 to 180, degrees
    int      mAccelX;              // 0x00008000 - accelerometer axis X, filtered, -32768 to 32767, 1/4096 G
    int      mAccelY;              // 0x00004000 - accelerometer axis Y, filtered, -32768 to 32767, 1/4096 G
    int      mAccelZ;              // 0x00002000 - accelerometer axis Z, filtered, -32768 to 32767, 1/4096 G
    int      mGyroX;               // 0x00001000 - gyro axis X, filtered, -20000 to 20000, 0.1 dps
    int      mGyroY;               // 0x00000800 - gyro axis Y, filtered, -20000 to 20000, 0.1 dps
    int      mGyroZ;               // 0x00000400 - gyro axis Z, filtered, -20000 to 20000, 0.1 dps
    int      mRightMotorBackEMF;   // 0x00000040 - right motor back EMF, filtered, -32768 to 32767, 22.5 cm
    int      mLeftMotorBackEMF;    // 0x00000020 - left motor back EMF, filtered, -32768 to 32767, 22.5 cm

    int      mQ0;                  // 0x80000000 - Quaternion Q0, -10000 to 10000, 1/10000 Q
    int      mQ1;                  // 0x40000000 - Quaternion Q1, -10000 to 10000, 1/10000 Q
    int      mQ2;                  // 0x20000000 - Quaternion Q2, -10000 to 10000, 1/10000 Q
    int      mQ3;                  // 0x10000000 - Quaternion Q3, -10000 to 10000, 1/10000 Q
    int      mOdoX;                // 0x08000000 - Odometer X, -32768 to 32767, cm
    int      mOdoY;                // 0x04000000 - Odometer Y, -32768 to 32767, cm
    int      mAccelOne;            // 0x02000000 - AccelOne, 0 to 8000, 1 mG
    int      mVelocityX;           // 0x01000000 - Velocity X, -32768 to 32767, mm/s
    int      mVelocityY;           // 0x00800000 - Velocity Y, -32768 to 32767, mm/s

    void Fetch (SpheroResponsePackage response, int mask1, int mask2)
    {
        int i = 0;
        if ((mask1 & 0x80000000) != 0) mRawAccelX = response.getInt16(2*i++);
        if ((mask1 & 0x40000000) != 0) mRawAccelY = response.getInt16(2*i++);
        if ((mask1 & 0x20000000) != 0) mRawAccelZ = response.getInt16(2*i++);
        if ((mask1 & 0x10000000) != 0) mRawGyroX = response.getInt16(2*i++);
        if ((mask1 & 0x08000000) != 0) mRawGyroY = response.getInt16(2*i++);
        if ((mask1 & 0x04000000) != 0) mRawGyroZ = response.getInt16(2*i++);
        if ((mask1 & 0x00400000) != 0) mRawRightMotorBackEMF = response.getInt16(2*i++);
        if ((mask1 & 0x00200000) != 0) mRawLeftMotorBackEMF = response.getInt16(2*i++);
        if ((mask1 & 0x00100000) != 0) mRawLeftMotorPWM = response.getInt16(2*i++);
        if ((mask1 & 0x00080000) != 0) mRawRightMotorPWM = response.getInt16(2*i++);
        if ((mask1 & 0x00040000) != 0) mIMUPitch = response.getInt16(2*i++);
        if ((mask1 & 0x00020000) != 0) mIMURoll = response.getInt16(2*i++);
        if ((mask1 & 0x00010000) != 0) mIMUYaw = response.getInt16(2*i++);
        if ((mask1 & 0x00008000) != 0) mAccelX = response.getInt16(2*i++);
        if ((mask1 & 0x00004000) != 0) mAccelY = response.getInt16(2*i++);
        if ((mask1 & 0x00002000) != 0) mAccelZ = response.getInt16(2*i++);
        if ((mask1 & 0x00001000) != 0) mGyroX = response.getInt16(2*i++);
        if ((mask1 & 0x00000800) != 0) mGyroY = response.getInt16(2*i++);
        if ((mask1 & 0x00000400) != 0) mGyroZ = response.getInt16(2*i++);
        if ((mask1 & 0x00000040) != 0) mRightMotorBackEMF = response.getInt16(2*i++);
        if ((mask1 & 0x00000020) != 0) mLeftMotorBackEMF = response.getInt16(2*i++);
        
        if ((mask2 & 0x80000000) != 0) mQ0 = response.getInt16(2*i++);
        if ((mask2 & 0x40000000) != 0) mQ1 = response.getInt16(2*i++);
        if ((mask2 & 0x20000000) != 0) mQ2 = response.getInt16(2*i++);
        if ((mask2 & 0x10000000) != 0) mQ3 = response.getInt16(2*i++);
        if ((mask2 & 0x08000000) != 0) mOdoX = response.getInt16(2*i++);
        if ((mask2 & 0x04000000) != 0) mOdoY = response.getInt16(2*i++);
        if ((mask2 & 0x02000000) != 0) mAccelOne = response.getInt16(2*i++);
        if ((mask2 & 0x01000000) != 0) mVelocityX = response.getInt16(2*i++);
        if ((mask2 & 0x00800000) != 0) mVelocityY = response.getInt16(2*i++);
    }
};


////////////////////////////////////////////////////////////////////////////////////////////////////


class Sphero
{
    /////////////////////////////////////////////////
    //
    //  Member variables
    
    boolean                            mValid = false;          // indicates whether we're in a valid state, and commands can be send
    int                                mSequenceNr = 1;         // message sequence number
    Serial                             mSerial;                 // serial port to sphero device
    
    boolean                            mTraceInput = true;     // option to write incoming bytes to console
    boolean                            mTraceOutput = true;    // option to write outgoing bytes to console
    
    SpheroResponsePackage              mLastResponse;           // response to the last message sent
    ArrayList<SpheroResponsePackage>   mAsyncPacketList;        // should be checked, handled and removed in draw() loop (index 0 is oldest message) 
    
    int                                mStreamingMask1;         // current data streaming mask1
    int                                mStreamingMask2;         // current data streaming mask2
    
    // the following values are set as a result to synchronous call results
    SpheroVersionInfo                  mVersionInfo;            // set after object construction
    SpheroDiagnosticsInfo              mLevel2Diagnostics;      // set after call to performLevel2Diagnostics()
    int                                mChassisID;              // set after call to getChassisID()
    SpheroLocatorInfo                  mLocatorInfo;            // set after call to getLocator()
    color                              mRGBLED;                 // set after call to getRGBLED()
    int                                mPermanentOptionFlags;   // set after call to getPermanentOptionFlags()
    int                                mTemporaryOptionFlags;   // set after call to getPermanentOptionFlags()
    int                                mDeviceMode;             // set after call to getDeviceMode()
    int                                mCoresRemaining;         // set after call to RefillBank() or BuyConsumable() or UseConsumable() or GrantCores()
    int                                mQuantityRemaining;      // set after call to BuyConsumable()
    int                                mConsumableID;           // set after call to UseConsumable()
    int                                mXPPercentToNextLevel;   // set after call to AddXP()
    SphereAttributeInfo                mAttributeInfo;          // set after call to LevelUpAttribute()
    int                                mPasswordSeed;           // set after call to getPasswordSeed()
    SpheroMacroInfo                    mMacroInfo;              // set after call to AbortMacro() or getMacroStatus()
    
    // the following values are set as a result to asynchronous messages
    int                                mPowerState;
    String                             mLevel1Diagnostics;
    SpheroStreamingInfo                mStreamingInfo;
    byte[]                             mConfigurationBlock;
    
    
    /////////////////////////////////////////////////
    //
    //  Constructor: e.g. new Sphero (this, "COM5")
    
    Sphero (PApplet app, String inComPort)
    {
        println ("Connecting...");
        mSerial = new Serial (app, inComPort, 115200); // 9600, 115200, etc
        println ("Connected.");
        
        mValid = true;
        
        mStreamingMask1 = 0;
        mStreamingMask2 = 0;
        
        mAsyncPacketList = new ArrayList<SpheroResponsePackage>();
        
        mVersionInfo = new SpheroVersionInfo();
        mLocatorInfo = new SpheroLocatorInfo();
        mAttributeInfo = new SphereAttributeInfo();
        mMacroInfo = new SpheroMacroInfo();
        mStreamingInfo = new SpheroStreamingInfo();
        
        this.getVersioning();
        println();
        println ("Sphero Version Info:");
        println ("Model:", mVersionInfo.mModel);
        println ("Hardware:", mVersionInfo.mHardware);
        println ("Version:", mVersionInfo.mVersion);
        println ("BootLoader:", mVersionInfo.mBootLoaderVersion);
        println ("OrbBasic:", mVersionInfo.mOrbBasicVersion);
        println ("MacroVersion:", mVersionInfo.mMacroVersion);
        println ("API:", mVersionInfo.mApiVersion);
        println();
    }
    
    
    /////////////////////////////////////////////////
    //
    //  Call this when terminating, stopping sphero and the serial port 
    
    void Finalize()
    {
        Stop();
        mValid = false;
        mSerial.stop();
    }
    
    
    /////////////////////////////////////////////////
    //
    //  The following should be called periodically (typically once in the draw() loop
    
    void Update()
    {
        readPendingPackets();
    }
    
    
    /////////////////////////////////////////////////
    //
    //  Convenience Commands
    
    boolean      SpinLeft (int speed)                { return this.setRawMotorValues (1, speed, 2, speed); }
    boolean      SpinRight (int speed)               { return this.setRawMotorValues (2, speed, 1, speed); }
    boolean      Stop()                              { return this.setRawMotorValues (3, 0, 3, 0); }
    boolean      Idle()                              { return this.setRawMotorValues (0, 0, 0, 0); }
    boolean      Sleep()                             { return this.Sleep (0, 0, 0); }
    boolean      Reset()                             { return this.Stop() && this.setRGBLED(0,0,0) && this.setBackLED(0); }
    
    
    /////////////////////////////////////////////////
    //
    //  The Core (Device ID 0x00)
    //
    
    boolean      Ping()                              { return sendCommand (DID_CORE, CMD_PING, null); }
    boolean      getVersioning()                     { boolean ok = sendCommand (DID_CORE, CMD_VERSION, null); if (ok) mVersionInfo.Fetch(mLastResponse); return ok; }
    boolean      setDeviceName (String name)         { int len = name.length(); int[] params = new int [len]; for (int i = 0; i < len; i++) params[i] = name.charAt(i); return sendCommand (DID_CORE, CMD_SET_BT_NAME, params); }
    boolean      getBlueToothInfo()                  { return sendCommand (DID_CORE, CMD_GET_BT_NAME, null); }
    boolean      setAutoReconnect (boolean enable)   { int[] params = { enable?1:0 }; return sendCommand (DID_CORE, CMD_SET_AUTO_RECONNECT, params); }
    boolean      getAutoReconnect()                  { return sendCommand (DID_CORE, CMD_GET_AUTO_RECONNECT, null); }
    boolean      getPowerState()                     { return sendCommand (DID_CORE, CMD_GET_PWR_STATE, null); }
    boolean      setPowerNotification (boolean enable)  { int[] params = { enable?1:0 }; return sendCommand (DID_CORE, CMD_SET_PWR_NOTIFY, params); }
    boolean      Sleep (int seconds, int macro_id, int orbBasic_line_nr) { int[] params = { seconds>>8, seconds, macro_id, orbBasic_line_nr>>8, orbBasic_line_nr }; return sendCommand (DID_CORE, CMD_SLEEP, params); }
    boolean      getVoltageTripPoints()              { return sendCommand (DID_CORE, GET_POWER_TRIPS, null); }
    boolean      setVoltageTripPoints (int low_voltage, int critical_voltage)  { int[] params = { low_voltage>>8, low_voltage, critical_voltage>>8, critical_voltage }; return sendCommand (DID_CORE, SET_POWER_TRIPS, params); }
    boolean      setInactivityTimeout (int seconds)  { int[] params = { seconds }; return sendCommand (DID_CORE, SET_INACTIVE_TIMER, params); }
    boolean      jumpToBootloader (int seconds)      { int[] params = { seconds }; return sendCommand (DID_CORE, CMD_GOTO_BL, params); }
    boolean      getLevel1Diagnostics()              { return sendCommand (DID_CORE, CMD_RUN_L1_DIAGS, null); }
    boolean      getLevel2Diagnostics()              { return sendCommand (DID_CORE, CMD_RUN_L2_DIAGS, null); }
    boolean      clearCounters()                     { return sendCommand (DID_CORE, CMD_CLEAR_COUNTERS, null); }
    boolean      assignTimeValue (int ms)            { int[] params = { ms }; return sendCommand (DID_CORE, CMD_ASSIGN_TIME, params); }
    boolean      pollPacketTimes (int ms)            { int[] params = { ms>>24, ms>>16, ms>>8, ms }; return sendCommand (DID_CORE, CMD_POLL_TIMES, params); }
    
    
    /////////////////////////////////////////////////
    //
    //  The Sphero (Device ID 0x02)
    //
    
    boolean      setHeading (int heading)            { int[] params = { heading>>8, heading }; return sendCommand (DID_SPHERO, CMD_SET_CAL, params); }
    boolean      setStabilization (boolean enable)   { int[] params = { enable?1:0 }; return sendCommand (DID_SPHERO, CMD_SET_STABILIZATION, params); }
    boolean      setRotationRate (int rate)          { int[] params = { rate }; return sendCommand (DID_SPHERO, CMD_SET_ROTATION_RATE, params); }
    boolean      getChassisID()                      { boolean ok = sendCommand (DID_SPHERO, CMD_GET_CHASSIS_ID, null); if (ok) this.mChassisID = mLastResponse.getInt16(0); return ok; }
    boolean      setSelfLevel (int options, int angle_limit, int timeout, int true_time)  { int[] params = { options, angle_limit, timeout, true_time }; return sendCommand (DID_SPHERO, CMD_SELF_LEVEL, params); }
    boolean      setDataStreaming (int divisor, int frames_per_packet, int packet_count, int mask1, int mask2)
                 {
                     mStreamingMask1 = mask1;
                     mStreamingMask2 = mask2;
                     int[] params = { divisor>>8, divisor, frames_per_packet>>8, frames_per_packet, mask1>>24, mask1>>16, mask1>>8, mask1, packet_count, mask2>>24, mask2>>16, mask2>>8, mask2 };
                     return sendCommand (DID_SPHERO, CMD_SET_DATA_STREAMING, params);
                 }
    
    boolean      setCollisionDetection (int method, int x_threshold, int y_threshold, int x_speed, int y_speed, int dead_time) { int[] params = { method, x_threshold, y_threshold, x_speed, y_speed, dead_time }; return sendCommand (DID_SPHERO, CMD_SET_COLLISION_DETECTION, params); }
    boolean      setLocator (int flags, int x, int y, int yaw_tare) { int[] params = { flags, x>>8, x, y>>8, y, yaw_tare }; return sendCommand (DID_SPHERO, CMD_LOCATOR, params); }
    boolean      setAccelerometerRange (int range_index) { int[] params = { range_index }; return sendCommand (DID_SPHERO, CMD_SET_ACCELERO, params); }
    boolean      getLocator()                        { boolean ok = sendCommand (DID_SPHERO, CMD_READ_LOCATOR, null); mLocatorInfo.Fetch(mLastResponse); return ok; }
    boolean      setRGBLED (int r, int g, int b)     { int[] params = { r, g, b, 0 }; return sendCommand (DID_SPHERO, CMD_SET_RGB_LED, params); }
    boolean      setBackLED (int intensity)          { int[] params = { intensity }; return sendCommand (DID_SPHERO, CMD_SET_BACK_LED, params); }
    boolean      getRGBLED()                         { boolean ok = sendCommand (DID_SPHERO, CMD_GET_RGB_LED, null); if (ok) mRGBLED = color(mLastResponse.mData[0], mLastResponse.mData[1], mLastResponse.mData[2]); return ok; }
    boolean      setRoll (int heading, int speed, int state) { int[] params = { speed, heading >> 8, heading, state }; return sendCommand (DID_SPHERO, CMD_ROLL, params); }
    boolean      setBoost (boolean start)            { int[] params = { start?1:0 }; return sendCommand (DID_SPHERO, CMD_BOOST, params); }
//  int *HUH?*   setMove()                           { int[] params = { }; return sendCommand (DID_SPHERO, CMD_MOVE, params); }
    boolean      setRawMotorValues (int left_mode, int left_power, int right_mode, int right_power)    { int[] params = { left_mode, left_power, right_mode, right_power }; return sendCommand(0x02, CMD_SET_RAW_MOTORS, params); }
    boolean      setMotionTimeout (int ms)           { int[] params = { ms>>8, ms }; return sendCommand (DID_SPHERO, CMD_SET_MOTION_TO, params); }
    boolean      setPermanentOptionFlags (int flags) { int[] params = { flags>>24, flags>>16, flags>>8, flags }; return sendCommand (DID_SPHERO, CMD_SET_OPTIONS_FLAG, params); }
    boolean      getPermanentOptionFlags()           { boolean ok = sendCommand (DID_SPHERO, CMD_GET_OPTIONS_FLAG, null); if (ok) mPermanentOptionFlags = mLastResponse.getInt32(0); return ok; }
    boolean      setTemporaryOptionFlags (int flags) { int[] params = { flags>>24, flags>>16, flags>>8, flags }; return sendCommand (DID_SPHERO, CMD_SET_TEMP_OPTIONS_FLAG, params); }
    boolean      getTemporaryOptionFlags()           { boolean ok = sendCommand (DID_SPHERO, CMD_GET_TEMP_OPTIONS_FLAG, null); if (ok) mTemporaryOptionFlags = mLastResponse.getInt32(0); return ok; }
    boolean      getConfigurationBlock (int id)      { int[] params = { id }; return sendCommand (DID_SPHERO, CMD_GET_CONFIG_BLK, params); }
//  boolean      setSSBModifierBlock()               { int[] params = { }; return sendCommand (DID_SPHERO, CMD_SET_SSB_PARAMS, params); }
    boolean      setDeviceMode (int mode)            { int[] params = { mode }; return sendCommand (DID_SPHERO, CMD_SET_DEVICE_MODE, params); }
//  int *TO DO*  setConfigurationBlock (byte[])      { int[] params = { }; return sendCommand (DID_SPHERO, CMD_SET_CFG_BLOCK, params); }
    boolean      getDeviceMode()                     { boolean ok = sendCommand (DID_SPHERO, CMD_GET_DEVICE_MODE, null); if (ok) mDeviceMode = mLastResponse.getInt32(0); return ok; }
    boolean      getSSB()                            { return sendCommand (DID_SPHERO, CMD_GET_SSB, null); }
//  int *TO DO*  setSSB (byte[])                     { int[] params = { }; return sendCommand (DID_SPHERO, CMD_SET_SSB, params); }
    boolean      RefillBank (int type)               { int[] params = { type }; boolean ok = sendCommand (DID_SPHERO, CMD_SSB_REFILL, params); mCoresRemaining = mLastResponse.getInt32(0); return ok; }
    boolean      BuyConsumable (int id, int quantity){ int[] params = { id, quantity }; boolean ok = sendCommand (DID_SPHERO, CMD_SSB_BUY, params); if (ok) { mQuantityRemaining = mLastResponse.getInt8(0); mCoresRemaining = mLastResponse.getInt32(1); } return ok; }
    boolean      UseConsumable (int id)              { int[] params = { id }; boolean ok = sendCommand (DID_SPHERO, CMD_SSB_USE_CONSUMEABLE, params); if (ok) { mConsumableID = mLastResponse.getInt8(0); mQuantityRemaining = mLastResponse.getInt8(1); } return ok; }
    boolean      GrantCores (int pw, int quantity, int flags) { int[] params = { pw>>24, pw>>16, pw>>8, pw, quantity>>24, quantity>>16, quantity>>8, quantity, flags}; boolean ok = sendCommand (DID_SPHERO, CMD_SSB_GRANT_CORES, params); if (ok) mCoresRemaining = mLastResponse.getInt32(1); return ok; }
    boolean      AddXP (int pw, int quantity)        { int[] params = { pw>>24, pw>>16, pw>>8, pw, quantity }; boolean ok = sendCommand (DID_SPHERO, CMD_SSB_ADD_XP, params); if (ok) mXPPercentToNextLevel = mLastResponse.getInt8(0); return ok; }
    boolean      LevelUpAttribute (int pw, int attr_id) { int[] params = { pw>>24, pw>>16, pw>>8, pw, attr_id }; boolean ok = sendCommand (DID_SPHERO, CMD_SSB_LEVEL_UP_ATTR, params); if (ok) mAttributeInfo.Fetch(mLastResponse); return ok; }
    boolean      getPasswordSeed()                   { boolean ok = sendCommand (DID_SPHERO, CMD_GET_PW_SEED, null); if (ok) mPasswordSeed = mLastResponse.getInt32(0); return ok; }
    boolean      EnableSSBAsyncMessages (boolean enable) { int[] params = { enable?1:0 }; return sendCommand (DID_SPHERO, CMD_SSB_ENABLE_ASYNC, params); }
    boolean      RunMacro (int id)                   { int[] params = { id }; return sendCommand (DID_SPHERO, CMD_RUN_MACRO, params); }
//  int *TO DO*  SaveTemporaryMacro()                { int[] params = { }; return sendCommand (DID_SPHERO, CMD_SAVE_TEMP_MACRO, params); }
//  int *TO DO*  SaveMacro()                         { int[] params = { }; return sendCommand (DID_SPHERO, CMD_SAVE_MACRO, params); }
    boolean      ReinitMacroExecutive()              { return sendCommand (DID_SPHERO, CMD_INIT_MACRO_EXECUTIVE, null); }
    boolean      AbortMacro()                        { boolean ok = sendCommand (DID_SPHERO, CMD_ABORT_MACRO, null); if (ok) mMacroInfo.Fetch(mLastResponse); return ok; }
    boolean      getMacroStatus()                    { boolean ok = sendCommand (DID_SPHERO, CMD_MACRO_STATUS, null);  if (ok) mMacroInfo.Fetch(mLastResponse); return ok; }
    boolean      setMacroParameter (int param_index, int val1, int val2) { int[] params = { param_index, val1, val2 }; return sendCommand (DID_SPHERO, CMD_SET_MACRO_PARAM, params); }
//  int *TO DO*  AppendMacroChunk()                  { int[] params = { }; return sendCommand (DID_SPHERO, CMD_APPEND_TEMP_MACRO_CHUNK, params); }
    boolean      EraseOrbBasicStorage (int area)     { int[] params = { area }; return sendCommand (DID_SPHERO, CMD_ERASE_ORBBAS, params); }
//  int *TO DO*  AppendOrbBasicFragment()            { int[] params = { }; return sendCommand (DID_SPHERO, CMD_APPEND_FRAG, params); }
    boolean      ExecuteOrbBasicProgram (int area, int start_line) { int[] params = { area, start_line>>8, start_line }; return sendCommand (DID_SPHERO, CMD_EXEC_ORBBAS, params); }
    boolean      AbortOrbBasicProgram()              { return sendCommand (DID_SPHERO, CMD_ABORT_ORBBAS, null); }
    boolean      SubmitValueToInputStatement (int val) { int[] params = { val>>24, val>>16, val>>8, val }; return sendCommand (DID_SPHERO, CMD_ANSWER_INPUT, params); }
    boolean      CommitRAMProgramToFlash()           { return sendCommand (DID_SPHERO, CMD_COMMIT_TO_FLASH, null); }
    
    
    /////////////////////////////////////////////////
    
    
    boolean sendCommand (int DID, int CID, int[] data)
    {
        int DLEN = data == null ? 1 : data.length + 1;
        int SEQ = mSequenceNr++;
        
        if (mTraceOutput)
            print ("tx: ");
        
        writeByte (0xFF);    // always 0xFF
        writeByte (0xFF);    // we want a reponse
        writeByte (DID);     // virtual target device on Sphero
        writeByte (CID);     // command ID
        writeByte (SEQ);     // message sequence number
        writeByte (DLEN);    // length of data + checksum
        
        // Calculate checksum
        int checksum = DID + CID + SEQ + DLEN;
        
        for (int i = 0; i < DLEN-1; i++)
        {
            writeByte (data[i]);
            checksum += data[i];
        }
        
        checksum = ~checksum;
        writeByte (checksum);
        
        if (mTraceOutput)
            println();
        
        return readResponse();
    }
    
    
    void readPacket()
    {
        if (mTraceInput)
            print ("rx: ");
        
        int SOP1, SOP2;
        
        while (true) // scan until we see a valid start of packet
        {
            SOP1 = readByte();
            if (SOP1 == 0xFF) // a message always starts with 0xFF
            {
                SOP2 = readByte();
                if (SOP2 == 0xFF || SOP2 == 0xFE) // 0xFF: response to message, 0xFE: async message
                    break;
            }
        }
        
        SpheroResponsePackage msg = new SpheroResponsePackage();
        msg.mSOP1 = SOP1;
        msg.mSOP2 = SOP2;
        
        switch (SOP2)
        {
            case 0xFF:  // normal response message
            {
                msg.mMRSP = readByte();         // message response
                msg.mSEQ = readByte();          // sequence number that should match the command sent
                msg.mDLEN = readByte();         // 8 bits data length, including checksum
                
                msg.mData = new byte [msg.mDLEN-1];
                for (int i = 0; i < msg.mDLEN-1; i++)
                    msg.mData[i] = (byte) readByte();
                
                msg.mCHK = readByte();
        
                mLastResponse = msg;
            } break;
            
            case 0xFE:  // asynchronous response message
            {
                msg.mIDCODE = readByte();                     // ID Code
                msg.mDLEN = (readByte() << 8) + readByte();   // 16 bits data length, including checksum
                
                msg.mData = new byte [msg.mDLEN-1];
                for (int i = 0; i < msg.mDLEN-1; i++)
                    msg.mData[i] = (byte) readByte();
                
                msg.mCHK = readByte();
                
                mAsyncPacketList.add (msg);
                
                // remove old messages if not removed by app
                if (mAsyncPacketList.size() > 20)
                    mAsyncPacketList.remove(0);
                
                handleAsyncMessage (msg);
            } break;
        }
        
        if (mTraceInput)
            println();
    }
    
    
    /////////////////////////////////////////////////
    
    
    boolean readResponse()
    {
        while (mLastResponse == null || mLastResponse.mSEQ < mSequenceNr-1)
            readPacket();
                
        return mLastResponse.mMRSP == 0;
    }
    
    
    void readPendingPackets()
    {
        while (mSerial.available() > 0)
            readPacket();
    }
    
    
    /////////////////////////////////////////////////
    
    
    int readByte()
    {
        while (mSerial.available() < 1)
            delay(1);
        
        int v = mSerial.read();
        
        if (mTraceInput)
            print (hex(v, 2), "");
        
        return v;
    }
    
    
    void writeByte (int v)
    {
        mSerial.write (v);
        if (mTraceOutput)
            print (hex(v, 2), "");
    }
    
    
    /////////////////////////////////////////////////
    
    
    String getLastResponseErrorText ()
    {
        return getResponseErrorText (mLastResponse.mMRSP);
    }
    
    
    String getResponseErrorText (int response_code)
    {
        switch (response_code)
        {
          case ORBOTIX_RSP_CODE_EGEN:          return "General, non-specific error";
          case ORBOTIX_RSP_CODE_ECHKSUM:       return "Received checksum failure";
          case ORBOTIX_RSP_CODE_EFRAG:         return "Received command fragment";
          case ORBOTIX_RSP_CODE_EBAD_CMD:      return "Unknown command ID";
          case ORBOTIX_RSP_CODE_EUNSUPP:       return "Command currently unsupported";
          case ORBOTIX_RSP_CODE_EBAD_MSG:      return "Bad message format";
          case ORBOTIX_RSP_CODE_EPARAM:        return "Parameter value(s) invalid";
          case ORBOTIX_RSP_CODE_EEXEC:         return "Failed to execute command";
          case ORBOTIX_RSP_CODE_EBAD_DID:      return "Unknown Device ID";
          case ORBOTIX_RSP_CODE_POWER_NOGOOD:  return "Voltage too low for reflash operation";
          case ORBOTIX_RSP_CODE_PAGE_ILLEGAL:  return "Illegal page number provided";
          case ORBOTIX_RSP_CODE_FLASH_FAIL:    return "Page did not reprogram correctly";
          case ORBOTIX_RSP_CODE_MA_CORRUPT:    return "Main Application corrupt";
          case ORBOTIX_RSP_CODE_MSG_TIMEOUT:   return "Msg state machine timed out";
        }
        
        return "(Unknown response code)";
    }
    
    
    /////////////////////////////////////////////////
    //
    //  Override this function to implement custom handling
    
    void handleAsyncMessage (SpheroResponsePackage msg)
    {
        switch (msg.mIDCODE)
        {
          case 0x01: // Power notifications
              mPowerState = msg.getInt8(0);
              break;
          case 0x02: // Level 1 Diagnostic response
              mLevel1Diagnostics = new String (msg.mData);
              break;
          case 0x03: // Sensor data streaming
              mStreamingInfo.Fetch (msg, mStreamingMask1, mStreamingMask2);
              break;
          case 0x04: // Config block contents
              mConfigurationBlock = msg.mData;
              break;
          case 0x05: // Pre-sleep warning (10 sec)
              println ("Warning: 10 seconds before going to sleep");
              break;
          case 0x06: // Macro markers
              // TO DO
              break;
          case 0x07: // Collision detected
              // TO DO
              break;
          case 0x08: // orbBasic PRINT message
              // TO DO
              break;
          case 0x09: // orbBasic error message, ASCII
              // TO DO
              break;
          case 0x0A: // orbBasic error message, binary
              // TO DO
              break;
          case 0x0B: // Self Level Result
              // TO DO
              break;
          case 0x0C: // Gyro axis limit exceeded (FW ver 3.10 and later)
              // TO DO
              break;
          case 0x0D: // Sphero's soul data
              // TO DO
              break;
          case 0x0E: // Level up notification
              // TO DO
              break;
          case 0x0F: // Shield damage notification
              // TO DO
              break;
          case 0x10: // XP update notification
              // TO DO
              break;
          case 0x11: // Boost update notification
              // TO DO
              break;
        }
    }
}

