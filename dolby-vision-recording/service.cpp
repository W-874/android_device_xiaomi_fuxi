// SPDX-License-Identifier: Apache-2.0

#include <signal.h>

#include <memory>

#include <android-base/logging.h>
#include <binder/ProcessState.h>
#include <codec2/hidl/1.0/ComponentStore.h>
#include <hidl/HidlTransportSupport.h>

namespace android {
std::shared_ptr<C2ComponentStore> GetCodec2DolbyComponentStore();
}

int main() {
    using android::hardware::media::c2::V1_0::utils::ComponentStore;

    signal(SIGPIPE, SIG_IGN);
    android::ProcessState::initWithDriver("/dev/hwbinder")->startThreadPool();
    android::hardware::configureRpcThreadpool(8, true);

    // Construct the HIDL adapter using the same headers as libcodec2_hidl@1.0.
    auto store = android::sp<ComponentStore>::make(android::GetCodec2DolbyComponentStore());
    if (store->registerAsService("dolby") != android::OK) {
        LOG(ERROR) << "Could not register the Dolby Codec2 component store";
        return 1;
    }
    android::hardware::joinRpcThreadpool();
    return 0;
}
