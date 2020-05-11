#ifndef NINJAMCLIENT_H
#define NINJAMCLIENT_H

#pragma once

#include "../../../../external/ninjam/ninjam/njclient.h"
#include "connectionproperties.h"
#include "log.h"
#include <mutex>
#include <thread>

namespace abNinjam {

enum NinjamClientStatus {
  ok = 0,
  serverNotProvided = 221,
  licenseNotAccepted = 222,
  connectionError = 223
};

class NinjamClient {

public:
  NinjamClient();
  ~NinjamClient();
  NinjamClientStatus connect(ConnectionProperties connectionProperties);
  void disconnect();
  void audiostreamOnSamples(float **inbuf, int innch, float **outbuf,
                            int outnch, int len, int srate);
  void audiostreamForSync(float **inbuf, int innch, float **outbuf, int outnch,
                          int len, int srate);
  auto &gsNjClient() { return njClient; }
  auto &gsStopConnectionThread() { return stopConnectionThread; }
  auto &gsMtx() { return mtx; }
  bool connected = false;
  void clearBuffers(float **buf, int nch, int len);

private:
  thread *connectionThread;
  NJClient *njClient = new NJClient;
  bool stopConnectionThread;
  mutex mtx;
};

} // namespace abNinjam

#endif // NINJAMCLIENT_H
