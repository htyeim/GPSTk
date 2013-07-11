%module gpstk_pylib
%{
    #include <sstream>

    // time:
    #include "../../../src/TimeSystem.hpp"
    #include "../../../src/TimeTag.hpp"
    #include "../../../src/UnixTime.hpp"
    #include "../../../src/ANSITime.hpp"
    #include "../../../src/CivilTime.hpp"
    #include "../../../src/MathBase.hpp"
    #include "../../../src/CommonTime.hpp"
    #include "../../../src/Exception.hpp"
    #include "../../../src/GPSZcount.hpp"
    #include "../../../src/GPSWeek.hpp"
    #include "../../../src/GPSWeekSecond.hpp"
    #include "../../../src/GPSWeekZcount.hpp"
    #include "../../../src/JulianDate.hpp"
    #include "../../../src/MJD.hpp"
    #include "../../../src/SystemTime.hpp"
    #include "../../../src/TimeConstants.hpp"
    #include "../../../src/TimeConverters.hpp"
    #include "../../../src/TimeString.hpp"
    #include "../../../src/YDSTime.hpp"
    #include "../../../src/Exception.hpp"
    #include "../../../src/TimeSystemCorr.hpp"

    // util:
    #include "../../../src/geometry.hpp"
    #include "../../../src/gps_constants.hpp"
    #include "../../../src/SatID.hpp"
    #include "../../../src/ObsIDInitializer.hpp"
    #include "../../../src/ObsID.hpp"
    #include "../../../src/GNSSconstants.hpp"
    #include "../../../src/Triple.hpp"
    #include "../../../src/ReferenceFrame.hpp"
    #include "../../../src/EllipsoidModel.hpp"
    #include "../../../src/Xvt.hpp"
    #include "../../../src/StringUtils.hpp"
    #include "../../../src/Position.hpp"
    #include "../../../src/Xv.hpp"
    #include "../../../src/convhelp.hpp"
    #include "../../../src/VectorBase.hpp"
    #include "../../../src/Vector.hpp"
    #include "../../../src/AstronomicalFunctions.hpp"

    // ?
    #include "../../../src/XvtStore.hpp"
    #include "../../../src/PZ90Ellipsoid.hpp"
    #include "../../../src/WGS84Ellipsoid.hpp"
    #include "../../../src/gpstkplatform.h"
    #include "../../../src/FFStreamError.hpp"
    #include "../../../src/FileStore.hpp"
    #include "../../../src/BinUtils.hpp"
    #include "../../../src/FFData.hpp"
    #include "../../../src/EngNav.hpp"
    #include "../../../src/YumaBase.hpp"
    #include "../../../src/FFStream.hpp"
    #include "../../../src/FFTextStream.hpp"
    #include "../../../src/AlmOrbit.hpp"
    #include "../../../src/YumaHeader.hpp"
    #include "../../../src/EngAlmanac.hpp"
    #include "../../../src/OrbElem.hpp"
    #include "../../../src/OrbElemStore.hpp"
    #include "../../../src/YumaStream.hpp"
    #include "../../../src/YumaData.hpp"
    #include "../../../src/GPSAlmanacStore.hpp"
    #include "../../../src/YumaAlmanacStore.hpp"
    #include "../../../src/SVNumXRef.hpp"
    #include "../../../src/GPSEphemerisStore.hpp"
    #include "../../../src/RinexSatID.hpp"
    #include "../../../src/GPS_URA.hpp"
    #include "../../../src/BrcClockCorrection.hpp"
    #include "../../../src/BrcKeplerOrbit.hpp"
    #include "../../../src/EngEphemeris.hpp"
    #include "../../../src/GalEphemeris.hpp"
    #include "../../../src/GalEphemerisStore.hpp"
    #include "../../../src/GloEphemeris.hpp"

    #include "../../../src/RinexClockBase.hpp"
    #include "../../../src/RinexObsBase.hpp"
    #include "../../../src/RinexObsHeader.hpp"
    #include "../../../src/RinexObsData.hpp"
    #include "../../../src/RinexObsID.hpp"
    #include "../../../src/RinexClockHeader.hpp"
    #include "../../../src/RinexClockData.hpp"
    #include "../../../src/RinexClockStream.hpp"
    #include "../../../src/RinexObsStream.hpp"

    #include "../../../src/Rinex3NavBase.hpp"
    #include "../../../src/Rinex3NavHeader.hpp"
    #include "../../../src/Rinex3NavStream.hpp"
    #include "../../../src/Rinex3NavData.hpp"
    #include "../../../src/OrbElemRinex.hpp"

    #include "../../../src/Rinex3ClockBase.hpp"
    #include "../../../src/Rinex3ObsBase.hpp"
    #include "../../../src/Rinex3ObsHeader.hpp"
    #include "../../../src/Rinex3ObsData.hpp"
    #include "../../../src/Rinex3ObsStream.hpp"
    #include "../../../src/Rinex3ClockHeader.hpp"
    #include "../../../src/Rinex3ClockData.hpp"
    #include "../../../src/Rinex3ClockStream.hpp"
    #include "../../../src/Rinex3EphemerisStore.hpp"

    #include "../../../src/TabularSatStore.hpp"
    #include "../../../src/ClockSatStore.hpp"
    #include "../../../src/SP3Base.hpp"
    #include "../../../src/SP3SatID.hpp"
    #include "../../../src/SP3Header.hpp"
    #include "../../../src/SP3Data.hpp"
    #include "../../../src/SP3Stream.hpp"
    #include "../../../src/PositionSatStore.hpp"
    #include "../../../src/SP3EphemerisStore.hpp"

    #include "../../../src/SEMBase.hpp"
    #include "../../../src/SEMHeader.hpp"
    #include "../../../src/SEMStream.hpp"
    #include "../../../src/SEMData.hpp"
    #include "../../../src/SEMAlmanacStore.hpp"




    typedef std::map<char, std::string> IdToValue; // defined in TimeTag.hpp
    using namespace gpstk;
%}

// =============================================================
//  Section 1: C++ template containers & typedefs
// =============================================================
%feature("autodoc","1");
%include "doc/doc.i"
%include "std_string.i"
%include "std_map.i"

%rename(__str__) *::asString() const;
%ignore *::dump;
%ignore *::operator<<;

%include "src/typemaps.i"
%include "src/std_vector_extra.i" // renamed since std_vector.i part of core swig
typedef std::map< char, std::string> IdToValue;
%template(map_int_char) std::map<int, char>;
  %template() std::pair<int, char>;
%template(map_int_string) std::map<int, std::string>;
  %template() std::pair<int, std::string>;
%template(map_char_int) std::map<char, int>;
  %template() std::pair<char, int>;
%template(map_string_int) std::map<std::string, int>;
  %template() std::pair<std::string, int>;
%include "src/Exception.i"

// =============================================================
//  Section 2: Time classes
// =============================================================
%include "src/TimeSystem.i"
%include "../../../src/TimeTag.hpp"
%include "../../../src/TimeConstants.hpp"
%ignore gpstk::CommonTime::get;
%include "../../../src/CommonTime.hpp"
%feature("notabstract") UnixTime;
%include "../../../src/UnixTime.hpp"
%feature("notabstract") SystemTime;
%include "../../../src/SystemTime.hpp"
%feature("notabstract") ANSITime;
%include "../../../src/ANSITime.hpp"
%feature("notabstract") CivilTime;
%include "src/CivilTime.i"
%include "../../../src/GPSZcount.hpp"
%include "../../../src/GPSWeek.hpp"
%feature("notabstract") GPSWeekSecond;
%include "../../../src/GPSWeekSecond.hpp"
%feature("notabstract") GPSWeekZcount;
%include "../../../src/GPSWeekZcount.hpp"
%feature("notabstract") JulianDate;
%include "../../../src/JulianDate.hpp"
%feature("notabstract") MJD;
%include "../../../src/MJD.hpp"
%feature("notabstract") YDSTime;
%include "../../../src/YDSTime.hpp"
%include "../../../src/TimeConverters.hpp"
%include "src/TimeString.i"
%include "../../../src/TimeSystemCorr.hpp"


// =============================================================
//  Section 3: General/Utils classes
// =============================================================
// Utils stuff
%include "../../../src/geometry.hpp"
%include "../../../src/gps_constants.hpp"
%include "src/SatID.i"
%include "../../../src/ObsIDInitializer.hpp"
%include "../../../src/ObsID.hpp"
%include "../../../src/GNSSconstants.hpp"
%include "src/Triple.i"
%include "src/ReferenceFrame.i"
%include "../../../src/EllipsoidModel.hpp"
%include "../../../src/Xvt.hpp"
%include "src/Position.i"
%include "../../../src/convhelp.hpp"
%include "../../../src/Xv.hpp"
%include "src/VectorBase.i"
%include "src/Vector.i"
%include "../../../src/AstronomicalFunctions.hpp"



// =============================================================
//  Section 4: "XvtStore and friends"
// =============================================================
%include "../../../src/PZ90Ellipsoid.hpp"
%include "../../../src/WGS84Ellipsoid.hpp"

%include "../../../src/XvtStore.hpp"
%template(XvtStore_SatID)  gpstk::XvtStore<gpstk::SatID>;
%template(XvtStore_string) gpstk::XvtStore<std::string>;

%include "../../../src/gpstkplatform.h"
%include "../../../src/FFStreamError.hpp"
%include "../../../src/FileStore.hpp"
%include "../../../src/BinUtils.hpp"
%include "../../../src/FFData.hpp"
%include "../../../src/EngNav.hpp"
%include "../../../src/YumaBase.hpp"
%include "../../../src/FFStream.hpp"
%include "../../../src/FFTextStream.hpp"
%include "../../../src/AlmOrbit.hpp"
%include "../../../src/YumaHeader.hpp"
%ignore gpstk::EngAlmanac::getUTC;
%include "../../../src/EngAlmanac.hpp"

%include "../../../src/OrbElem.hpp"
%include "../../../src/OrbElemStore.hpp"
%include "../../../src/AlmOrbit.hpp"
%include "../../../src/YumaStream.hpp"
%include "../../../src/YumaData.hpp"
%include "../../../src/GPSAlmanacStore.hpp"
%template(FileStore_YumaHeader) gpstk::FileStore<gpstk::YumaHeader>;
%include "../../../src/YumaAlmanacStore.hpp"

%include "../../../src/SVNumXRef.hpp"
%include "../../../src/GPSEphemerisStore.hpp"
%include "../../../src/RinexSatID.hpp"
%include "../../../src/GPS_URA.hpp"
%include "../../../src/BrcClockCorrection.hpp"
%include "../../../src/BrcKeplerOrbit.hpp"
%include "../../../src/EngEphemeris.hpp"
%include "../../../src/GalEphemeris.hpp"
%include "../../../src/GalEphemerisStore.hpp"
%include "../../../src/GloEphemeris.hpp"
// %include "../../../src/GloEphemerisStore.hpp" // not ready yet

%include "../../../src/RinexClockBase.hpp"
%include "../../../src/RinexObsBase.hpp"
%include "../../../src/RinexObsHeader.hpp"
%include "../../../src/RinexObsID.hpp"
%include "../../../src/RinexObsStream.hpp"
%include "../../../src/RinexClockHeader.hpp"
%include "../../../src/RinexClockData.hpp"
%include "../../../src/RinexClockStream.hpp"

%rename (toEngEphemeris) gpstk::Rinex3NavData::operator EngEphemeris() const;
%rename (toGalEphemeris) gpstk::Rinex3NavData::operator GalEphemeris() const;
// %rename (toGloEphemeris) gpstk::Rinex3NavData::operator GloEphemeris() const;
%include "../../../src/Rinex3NavBase.hpp"
%include "../../../src/Rinex3NavHeader.hpp"
%include "../../../src/Rinex3NavStream.hpp"
%include "../../../src/Rinex3NavData.hpp"
%include "../../../src/OrbElemRinex.hpp"

%include "../../../src/Rinex3ClockBase.hpp"
%include "../../../src/Rinex3ObsBase.hpp"
%include "../../../src/Rinex3ObsHeader.hpp"
%include "../../../src/Rinex3ObsData.hpp"
%include "../../../src/Rinex3ObsStream.hpp"
%include "../../../src/Rinex3ClockHeader.hpp"
%include "../../../src/Rinex3ClockData.hpp"
%include "../../../src/Rinex3ClockStream.hpp"
%include "../../../src/Rinex3EphemerisStore.hpp"

%include "../../../src/TabularSatStore.hpp"
%include "src/ClockSatStore.i"

%include "../../../src/SP3Base.hpp"
%include "../../../src/SP3SatID.hpp"
%include "../../../src/SP3Header.hpp"
%include "../../../src/SP3Data.hpp"
%include "../../../src/SP3Stream.hpp"
%include "src/PositionSatStore.i"
%include "../../../src/SP3EphemerisStore.hpp"

%rename (toAlmOrbit) gpstk::SEMData::operator AlmOrbit() const;
%include "../../../src/SEMBase.hpp"
%include "../../../src/SEMHeader.hpp"
%include "../../../src/SEMStream.hpp"
%include "../../../src/SEMData.hpp"
%template(FileStore_SEMHeader) gpstk::FileStore<gpstk::SEMHeader>;
%include "../../../src/SEMAlmanacStore.hpp"


// Encapsulation of many the __str__, __getitem__, etc. functions to avoid clutter.
// When the only change to a class is adding a simple wrapper, add to pythonfunctions
// instead of creating another small file.
%include "src/pythonfunctions.i"
%include "src/FileIO.i"
